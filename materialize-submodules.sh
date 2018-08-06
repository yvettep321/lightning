git rm .gitmodules
git rm --cached external/jsmn external/libbase58 external/libsodium external/libbacktrace external/libwally-core
rm -rf external/jsmn external/libbase58 external/libsodium external/libbacktrace external/libwally-core

rm -rf .git/modules/external/jsmn .git/modules/external/libbase58 .git/modules/external/libsodium .git/modules/external/libbacktrace .git/modules/external/libwally-core

git commit -am "scripted: Remove submodules for materialization"

git clone --recursive https://github.com/zserge/jsmn external/jsmn
git clone --recursive https://github.com/bitcoin/libbase58.git external/libbase58
git clone --recursive https://github.com/jedisct1/libsodium.git external/libsodium
git clone --recursive https://github.com/ianlancetaylor/libbacktrace.git external/libbacktrace
git clone --recursive https://github.com/ElementsProject/libwally-core.git external/libwally-core

rm -rf external/jsmn/.git external/libbase58/.git/ external/libsodium/.git/ external/libbacktrace/.git/ external/libwally-core/.git

# Move gitignore out of the way so the following adds work
mv .gitignore .gitignore.bak

git add external/jsmn
git add external/libbase58
git add external/libsodium
git add external/libbacktrace
git add external/libwally-core

mv .gitignore.bak .gitignore

git commit -am "scripted: Materialize submodules"
