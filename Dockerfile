FROM mcr.microsoft.com/powershell:latest

RUN mkdir /workdir
COPY main.ps1 /workdir/main.ps1
COPY PSGHA.psm1 /workdir/PSGHA.psm1

ENTRYPOINT ["pwsh", "/workdir/main.ps1"]