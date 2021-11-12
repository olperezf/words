# Ruby On Rails 6 TDD - RSpec
## Aplicación donde se podrá aprender el vocabulario del idioma Ingles (u otros idiomas haciendo alguna modificación en el código).
El Objetivo del desarrollo de ésta aplicación es aprender como manejar Test-Driven Development basado en Rspec

Es una aplicación que cumple con: 
- las funciones básicas CRUD. 
- Validaciones. 
- Boostrapt en las vistas.
- Registrar un usuario para iniciar sessión.
- Editar el usuario y password.
- RSpec para las pruebas de lógica en los módelos y controladores, entre otros ...

### Gemas utilizadas en esta aplicación:

- **gem 'haml-rails':** Haml es un lenguage de marcas principalmente usado con Ruby, de forma simple y limpia describe el HTML de cualquier documento web. Es una alternativa popular respecto a usar el lenguage de plantilla de Rails (.erb) y permite embeber código Ruby. Apunta a reducir la repetición en tus anotaciones cerrando los tags, basándose en la estructura de identación del código. El resultado es una anotación bien estructurada, que no se repite, lógica y fácil de leer. https://github.com/haml/haml-rails

- **gem 'rexml':** Un kit de herramientas XML para Ruby, rexml admite el análisis de documentos tanto en árbol como en flujo. El análisis de secuencias es más rápido. https://github.com/ruby/rexml

- **gem 'simple_form':** Simple Form tiene como objetivo ser lo más flexible posible. El objetivo básico de Simple Form es no tocar su forma de definir el diseño. https://github.com/heartcombo/simple_form

- **gem 'language_list':** Una lista de idiomas basada en ISO-639-1 e ISO-639-3 con funciones para recuperar solo idiomas comunes.

- **gem 'devise':** Devise es una solución de autenticación flexible para Rails. https://github.com/heartcombo/devise

- **gem 'pundit':** Pundit proporciona un conjunto de ayudas que lo guían para aprovechar las clases regulares de Ruby y los patrones de diseño orientados a objetos para construir un sistema de autorización simple, robusto y escalable. https://github.com/varvet/pundit

- **gem 'kaminari':** Un paginador sofisticado, limpio, potente, personalizable y basado en Scope & Engine para marcos de aplicaciones web y ORM modernos. https://github.com/kaminari/kaminari

- **gem 'bootstrap4-kaminari-views':** Estilo Bootstrap 4 (probado para bootstrap 4.0.0) para Kaminari. https://github.com/KamilDzierbicki/bootstrap4-kaminari-views

- **gem 'cocoon':** Cocoon facilita el manejo de formularios anidados. https://github.com/nathanvda/cocoon

- **gem 'faker':** Esta gema es un puerto de la biblioteca Data :: Faker de Perl que genera datos falsos. https://github.com/faker-ruby/faker

- **gem 'rspec-rails':** rspec-rails trae el marco de prueba RSpec a Ruby on Rails como una alternativa directa a su marco de prueba predeterminado. https://github.com/rspec/rspec-rails

- **gem 'brakeman':** Brakeman es una herramienta de análisis estático que comprueba las aplicaciones de Ruby on Rails en busca de vulnerabilidades de seguridad. https://github.com/presidentbeef/brakeman

- **gem 'factory_bot_rails':** Factory Bot es una biblioteca que proporciona métodos de fábrica para crear dispositivos de prueba para pruebas de software automatizadas. Los objetos de accesorios se pueden crear sobre la marcha; pueden ser objetos Ruby simples con un estado predefinido, objetos ORM con registros de base de datos existentes u objetos simulados. Factory Bot se utiliza a menudo para probar aplicaciones Ruby on Rails; donde reemplaza el mecanismo de fijación incorporado de Rails. La configuración predeterminada de Rails utiliza una base de datos precargada como accesorios de prueba, que son globales para el conjunto de pruebas completo. Factory Bot, por otro lado, permite a los desarrolladores definir una configuración diferente para cada prueba y, por lo tanto, ayuda a evitar dependencias dentro de la suite de pruebas. https://github.com/thoughtbot/factory_bot_rails

- **gem 'shoulda-matchers':** Shoulda Matchers proporciona una sola línea compatible con RSpec- y Minitest para probar la funcionalidad común de Rails que, si se escribiera a mano, sería mucho más larga, más compleja y propensa a errores. https://github.com/thoughtbot/shoulda-matchers

