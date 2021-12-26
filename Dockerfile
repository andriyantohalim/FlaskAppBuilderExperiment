FROM python

RUN mkdir /service
COPY first_app/ /service/first_app/
COPY Flask-AppBuilder-Skeleton/ /service/Flask-AppBuilder-Skeleton
WORKDIR /service/Flask-AppBuilder-Skeleton
RUN python -m pip install --upgrade pip
RUN python -m pip install -r requirements.txt
RUN #python -m grpc_tools.protoc -I ../protobufs --python_out=. --grpc_python_out=. ../protobufs/recommendations.proto

EXPOSE 5000
ENV FLASK_APP=marketplace.py
ENTRYPOINT ["fabmanager", "run", "--host=0.0.0.0"]
