import os
from flask import Blueprint, request, render_template, jsonify, current_app, send_from_directory

from applications.common.utils.http import fail_api, success_api, table_api
from applications.common.utils.rights import authorize
from applications.extensions import db
from applications.models import Photo,User
from applications.common.utils import upload as upload_curd


admin_file = Blueprint('adminFile', __name__, url_prefix='/admin/file')


#  图片管理
@admin_file.get('/')
@authorize("admin:file:main", log=True)
def index():
    return render_template('admin/photo/photo.html')


@admin_file.post('/mindex')
def mindex():

    return render_template('mobile/index.html')

@admin_file.post('/mupload')
@authorize("admin:file:main", log=True)
def mupload():
    if 'file' in request.files:
        print('------------')
        photo = request.files['file']
        mime = request.files['file'].content_type
        current_ip = request.remote_addr
        current_location=upload_curd.get_ip_info(current_ip)
        print(current_location)
        file_url = upload_curd.upload_one(photo=photo, mime=mime, city=current_location[1])
        res = {
            "msg": "Upload success!",
            "code": 0,
            "success": True,
            "data":
                {"src": file_url}
        }
        citylist_o = upload_curd.get_citylist()
        l = []
        for c in citylist_o:
            ccc = dict(zip(c.keys(), c))
            print(ccc)
            l.append(ccc['city'])
        upload_curd.get_map(l)
        return jsonify(res)
    return fail_api()


#  图片数据
@admin_file.get('/table1')
@authorize("admin:file:main", log=True)
def table1():
    page = request.args.get('page', type=int)
    limit = request.args.get('limit', type=int)
    data, count = upload_curd.get_photo(page=page, limit=limit)
    return table_api(data=data, count=count)

@admin_file.get('/table')
@authorize("admin:file:main", log=True)
def table():
    page = request.args.get('page', type=int)
    limit = request.args.get('limit', type=int)
    city = request.args.get('city', 'all')
    print(city)
    if city=='all':
        data, count = upload_curd.get_photo(page=page, limit=limit)
        return table_api(data=data, count=count)

    else:
        data, count = upload_curd.get_file_by_city(city,page,limit)
        #return render_template('admin/photo/photo1.html', cityn=city)
        return table_api(data=data, count=count)


@admin_file.get('/citylist')
@authorize("admin:file:main", log=True)
def citylist():
    citylist_o= upload_curd.get_citylist()
    #citylist_d=row2dict(citylist)
    print(citylist_o)
    l=[]

    for c in citylist_o:
        ccc=dict(zip(c.keys(), c))
        print(ccc)
        l.append(ccc['city'])
    #print(type(citylist[0]))
    print(l)
    print(l[0])
    citylist={'city':l}
    #print(type(citylist))
    return  citylist

#   上传
@admin_file.get('/upload')
@authorize("admin:file:add", log=True)
def upload():
    return render_template('admin/photo/photo_add.html')


#   上传接口
@admin_file.post('/upload')
@authorize("admin:file:add", log=True)
def upload_api():
    if 'file' in request.files:
        photo = request.files['file']
        mime = request.files['file'].content_type
        current_ip = request.remote_addr
        current_location=upload_curd.get_ip_info(current_ip)
        print(current_location)
        file_url = upload_curd.upload_one(photo=photo, mime=mime, city=current_location[1])
        res = {
            "msg": "上传成功",
            "code": 0,
            "success": True,
            "data":
                {"src": file_url}
        }
        citylist_o = upload_curd.get_citylist()
        l = []
        for c in citylist_o:
            ccc = dict(zip(c.keys(), c))
            print(ccc)
            l.append(ccc['city'])
        upload_curd.get_map(l)
        return jsonify(res)
    return fail_api()


#    图片删除
@admin_file.route('/delete', methods=['GET', 'POST'])
@authorize("admin:file:delete", log=True)
def delete():
    _id = request.form.get('id')
    res = upload_curd.delete_photo_by_id(_id)
    if res:
        return success_api(msg="删除成功")
    else:
        return fail_api(msg="删除失败")

# dowload file
@admin_file.route('/download', methods=['GET', 'POST'])
@authorize("admin:file:delete", log=True)
def download():
    _id = request.form.get('id')
    file_path,file_name=upload_curd.get_path_by_id(_id)
    print(file_path,file_name)

    #res = upload_curd.delete_photo_by_id(_id)
    #real_fpath=file_path
    print('bbbbbbbbbbbbbb')
    response = send_from_directory(file_path, file_name)
    print('rrrrbbbbbbbbbbbbbb')

    print(response)
    #response.headers["Content-Disposition"] = "attachment; filename={}".format(file_name)
    return response

# select city
@admin_file.route('/select', methods=['GET', 'POST'])
@authorize("admin:file:delete", log=True)
def select():
    city = request.args.get('city')
    print(city)
    #city='Shanghai'
    #file_path,file_name=upload_curd.get_file_by_city(city)
    data, count = upload_curd.get_file_by_city(city)
    #return tablec_api(data=data, count=count)
    return render_template('admin/photo/photo1.html',cityn=city)



# 图片批量删除
@admin_file.route('/batchRemove', methods=['GET', 'POST'])
@authorize("admin:file:delete", log=True)
def batch_remove():
    ids = request.form.getlist('ids[]')
    photo_name = Photo.query.filter(Photo.id.in_(ids)).all()
    upload_url = current_app.config.get("UPLOADED_PHOTOS_DEST")
    for p in photo_name:
        os.remove(upload_url + '/' + p.name)
    photo = Photo.query.filter(Photo.id.in_(ids)).delete(synchronize_session=False)
    db.session.commit()
    if photo:
        return success_api(msg="删除成功")
    else:
        return fail_api(msg="删除失败")


