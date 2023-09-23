DIG xmake repository
====================
[![License](https://img.shields.io/static/v1?label=license&message=CC%20BY-ND%204.0&color=blue)](https://creativecommons.org/licenses/by-nd/4.0/)

This is a private xmake repository. You can use it as you need, but can not modify.

Instalation
===========
It is not recomended to install this repository as global, since your project can be build in machines without this repository as global..

1 - Per Project (recomended)
----------------------------
```lua
add_repositories("dig-repo https://github.com/DIG-/cpp-xrepo.git")
```
Add above line before any `add_require` in your project `xmake.lua`.

2 - Global
----------
```shell
xmake repo -a dig-repo https://github.com/DIG-/cpp-xrepo.git
```

License
=======
[CC BY-ND 4.0](https://creativecommons.org/licenses/by-nd/4.0/)

- You can use and re-dist freely.
- You can not modify anything of this repository.
- You can use it as a part of your project.
