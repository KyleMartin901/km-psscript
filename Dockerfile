
FROM microsoft/powershell:6.0.4-ubuntu-16.04

# Create working directory
RUN mkdir -p /temp/scripts

# Install modules from PSGallery
SHELL [ "pwsh", "-command" ]
RUN Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
RUN Install-Module -Name PSScriptAnalyzer -RequiredVersion 1.17.1

# Copy in source code
WORKDIR /temp/scripts
COPY . /temp/scripts

CMD ["/bin/pwsh"]