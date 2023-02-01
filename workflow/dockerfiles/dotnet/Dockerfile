FROM registry.fedoraproject.org/fedora:37 as dotnet-sdk
RUN dnf install -y dotnet-sdk-7.0 && dnf clean all

FROM registry.fedoraproject.org/fedora:37 as aspnetcore-runtime
RUN dnf install -y aspnetcore-runtime-7.0 && dnf clean all

FROM dotnet-sdk as build-env
RUN mkdir /src
WORKDIR /src
COPY *.csproj .
RUN dotnet restore
COPY . .
RUN dotnet publish -c Release -o /publish

FROM aspnetcore-runtime as app
WORKDIR /publish
COPY --from=build-env /publish .
ENV ASPNETCORE_URLS="http://0.0.0.0:8080"
EXPOSE 8080
ENTRYPOINT ["dotnet", "HelloContainer.dll"]
