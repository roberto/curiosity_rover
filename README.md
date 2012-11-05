[![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/roberto/curiosity_rover) [![Build Status](https://secure.travis-ci.org/roberto/curiosity_rover.png)](http://travis-ci.org/roberto/curiosity_rover)

Sistema usado pela NASA para controlar o pirata curioso.

Para executar a simulação:

```
git clone git@github.com:roberto/curiosity_rover.git
cd curiosity_rover
./configure
make
```

Após isso, para rodar os testes:

```
bundle install
bundle exec rake
```

Utilize `bundle install --without mac` caso não esteja utilizando MacOSX.

Para cobertura de testes:

```
coverage=ON bundle exec rake
open coverage/index.html
```
