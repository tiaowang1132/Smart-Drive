from flask import Flask
from flask_uploads import configure_uploads
from flask_uploads import UploadSet, IMAGES,DOCUMENTS,DEFAULTS

photos = UploadSet('photos', DEFAULTS)
#docs = UploadSet('photos', DOCUMENTS)  #new added


def init_upload(app: Flask):
    configure_uploads(app, photos)
    #configure_uploads(app, docs)   #new added

