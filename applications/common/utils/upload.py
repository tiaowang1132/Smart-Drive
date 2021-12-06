import os
from flask import current_app
from sqlalchemy import desc
from applications.extensions import db
from applications.extensions.init_upload import photos
from applications.models import Photo
from applications.schemas import PhotoOutSchema
from applications.common.curd import model_to_dicts
import requests
import json


import folium

def getzuob(city):
    return 1,2

def get_map(l):
    # define the world map
    world_map = folium.Map()
    lo={}
    for city in l:
        li=[]
        j,w=getzuob(city)
        li.append(j)
        li.append(w)
        lo[city]=li
    lo={'Beijing':[39.95, 118.33],'Shanghai':[30, 120.33],'Chongqing':[34,110],'Toronto':[43,-79],'Victoria':[48,-123]}

    for k,v in lo.items():
        folium.Marker(
            location=v,
            popup='<a href=http://127.0.0.1:5000/admin/file/select?city='+k+'>'+k+'</a>',
            #icon=folium.Icon(color='red', icon='info-sign')
        ).add_to(world_map)
    # display world map
    world_map.save('templates/admin/world_map.html')

def get_ip_info(dogip):
    geoinfo=[]
    param= {'ip': "23.83.225.238"}
    r = requests.get('http://ip-api.com/json/', params=param)
    #flasprint(r.content)
    res = json.loads(r.content)
    if res['status'] != 'success':
        fu = [' ', ' ']
        return fu
    print(res)
    print(type(res))
    country = res['country']
    city=res['city']
    geoinfo.append(country)
    geoinfo.append(city)
    return geoinfo

def get_photo(page, limit):
    photo = Photo.query.order_by(desc(Photo.create_time)).paginate(page=page, per_page=limit, error_out=False)
    count = Photo.query.count()
    data = model_to_dicts(schema=PhotoOutSchema, data=photo.items)
    return data, count


def upload_one(photo, mime,city):
    filename = photos.save(photo)
    file_url = '/_uploads/photos/'+filename
    # file_url = photos.url(filename)
    upload_url = current_app.config.get("UPLOADED_DATAFILES_DEST")
    size = os.path.getsize(upload_url + '/' + filename)
    photo = Photo(name=filename, href=file_url, mime=mime, size=size, city=city)
    db.session.add(photo)
    db.session.commit()
    return file_url


def delete_photo_by_id(_id):
    photo_name = Photo.query.filter_by(id=_id).first().name
    photo = Photo.query.filter_by(id=_id).delete()
    db.session.commit()
    upload_url = current_app.config.get("UPLOADED_PHOTOS_DEST")
    os.remove(upload_url + '/' + photo_name)
    return photo


def get_path_by_id(_id):
    file_name = Photo.query.filter_by(id=_id).first().name
    file_url=Photo.query.filter_by(id=_id).first().href
    return file_url,file_name


def get_file_by_city(city,page=1,limit=10):
    #page=1
    #limit=10
    #file_name = Photo.query.filter_by(city='Beijing').first().name
    #print(file_name)
    photo = Photo.query.filter_by(city=city).order_by(desc(Photo.create_time)).paginate(page=page, per_page=limit, error_out=False)
    count = Photo.query.count()
    data = model_to_dicts(schema=PhotoOutSchema, data=photo.items)
    #print(data)
    return data, count

def get_citylist():
    #sql = 'select DISTINCT city from admin_photo'
    #res = db.session.execute(sql)
    citylist=[]
    res=Photo.query.with_entities(Photo.city).distinct().all()
    print(res)
    print(type(res))
    #for city in Photo.query.with_entities(Photo.city).distinct().all():
    #    print(city)
    #   citylist.append(city)
    #res2=db.session.query(Photo.city).distinct().all()
    return res

