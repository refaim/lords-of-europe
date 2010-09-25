@echo off

set map=Lords Of Europe 3.0 RU M5.w3x

set base=%CD%
set tmp_target="%base%\tmp\%map%"
set dev_target="%base%\Lords Of Europe 3.0 RU Dev.w3x"
set soft=%base%\soft

copy /Y "other\Lords Of Europe 3.0 RU Basis.w3x" %tmp_target% || exit 1

cd data || exit 1

"%soft%\sfmpq" a %tmp_target% "%base%\listfile_data.txt" || exit 1
cd "%base%" || exit 1

copy /Y data\war3map.w3* tmp\ || exit 1
for /f %%I in (%base%\listfile_extra.txt) do (copy data\%%I tmp\ || exit 1)

echo %tmp_target%

"%soft%\gettext\msgfmt" other\translation.po -o other\translation.mo || exit 1
"%soft%\w3o_localize" other\translation.mo tmp\war3map.w3a tmp\war3map.w3b tmp\war3map.w3d tmp\war3map.w3h tmp\war3map.w3q tmp\war3map.w3t tmp\war3map.w3u || exit 1

cd tmp || exit 1
"%soft%\sfmpq" a %tmp_target% "%base%\listfile_extra.txt" || exit 1

for /f %%I in (%base%\listfile_extra.txt) do (del /Q tmp\%%I || exit 1)
cd %base% || exit 1

del /Q %dev_target%
del /Q %dev_target%.j
"%soft%\VXJWTSOPT" %tmp_target% --do %dev_target% --checkall --exit || exit 1
del /Q %dev_target%.j
del /Q %tmp_target%

echo ---
echo Map archive was successfully built