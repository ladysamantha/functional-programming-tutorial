FROM microsoft/dotnet:2.1-sdk as build

WORKDIR /app
COPY ./example-fs/*.fsproj ./

RUN dotnet restore
COPY ./example-fs/*.fs ./

RUN dotnet publish -c Release -o out

FROM microsoft/dotnet:2.1-runtime as runtime
WORKDIR /app
COPY ./*.txt ./
COPY --from=build /app/out .
ENTRYPOINT [ "dotnet", "functional-demo.dll" ]
