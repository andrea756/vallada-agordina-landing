@echo off
cd /d "%~dp0"
npx --yes http-server -p 5175 -c-1
