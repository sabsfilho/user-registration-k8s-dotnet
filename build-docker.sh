#reference
#https://github.com/dotnet/dotnet-docker/blob/main/samples/releasesapi/README.md
#build
docker build -t "user-registration-app:1.0.1" --build-arg build_number=1.0.1 .
#run
docker run --rm -it -p 8000:8080 -e ASPNETCORE_HTTP_PORTS=8080 user-registration-app:1.0.1
#remove
#docker rm user-registration-app:1.0.1