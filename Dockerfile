#https://learn.microsoft.com/en-us/dotnet/architecture/microservices/net-core-net-framework-containers/official-net-docker-images

FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build

ARG build_number=1.0.1

WORKDIR /src

COPY UserRegistration.sln ./
COPY UserRegistrationLib/ ./UserRegistrationLib/
COPY UserRegistrationApp/ ./UserRegistrationApp/

RUN dotnet restore

COPY . .

WORKDIR /src/UserRegistrationLib
RUN dotnet build --configuration Release -o /app --no-restore "-p:Version=${build_number}"

WORKDIR /src/UserRegistrationApp
RUN dotnet build --configuration Release -o /app --no-restore "-p:Version=${build_number}"

FROM build AS publish
RUN dotnet publish --configuration Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["./UserRegistrationApp"]