from flask import Blueprint, request, render_template
admin_Mobile = Blueprint('adminMobile', __name__, url_prefix='/admin/mobile')


#  图片管理
@admin_Mobile.get('/upload')
def upload():
    return render_template('mobile/index.html')