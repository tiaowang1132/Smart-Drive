from flask import Blueprint, render_template
from flask_login import login_required, current_user
from applications.common.utils import upload as upload_curd


admin_bp = Blueprint('admin', __name__, url_prefix='/admin')


# 首页
@admin_bp.get('/')
@login_required
def index():
    user = current_user
    return render_template('admin/index.html', user=user)


# 控制台页面
@admin_bp.get('/welcome')
@login_required
#@authorize("admin:file:delete", log=True)
def welcome():
    citylist_o = upload_curd.get_citylist()
    l = []
    for c in citylist_o:
        ccc = dict(zip(c.keys(), c))
        print(ccc)
        l.append(ccc['city'])
    upload_curd.get_map(l)
    return render_template('admin/world_map.html')


# show map
@admin_bp.route('/map', methods=['GET', 'POST'])
#@authorize("admin:file:delete", log=True)
def map():
    #city = request.form.get('select_city')
    #print(city)
    #file_path,file_name=upload_curd.get_file_by_city(city)
    #data, count = upload_curd.get_file_by_city(city)
    return render_template('admin/photo/photo.html')