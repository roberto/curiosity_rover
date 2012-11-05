[![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/roberto/curiosity_rover) [![Build Status](https://secure.travis-ci.org/roberto/curiosity_rover.png)](http://travis-ci.org/roberto/curiosity_rover)

Sistema usado pela NASA para controlar o pirata curioso.

Observações:
* Utilizei MacOSX 10.8 no desenvolvimento, porém dependente da plataforma apenas as gems `terminal-notifier-guard`, `rb-fsevent` utilizadas nos testes.

Para executar a simulação:

```
git clone git@github.com:roberto/curiosity_rover.git
cd curiosity_rover
./configure
make
```

Após isso, para rodar os testes:

```
bundle
rake
```

Com cobertura:

```
coverage=ON rake
open coverage/index.html
```
