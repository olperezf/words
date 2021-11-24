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


### Gemas utilizadas en la aplicación

<details>
     <summary> Ver Gemas... </summary>
  
- **gem 'haml-rails':** Haml es un lenguage de marcas principalmente usado con Ruby, de forma simple y limpia describe el HTML de cualquier documento web. Es una alternativa popular respecto a usar el lenguage de plantilla de Rails (.erb) y permite embeber código Ruby. Apunta a reducir la repetición en tus anotaciones cerrando los tags, basándose en la estructura de identación del código. El resultado es una anotación bien estructurada, que no se repite, lógica y fácil de leer. https://github.com/haml/haml-rails
     
     Ejemplo de la vista index con Haml:
     
          %h1 All words
          %table.table
            %thead
              %tr
                %th
                  \#
                %th
                  Content
                %th
                  Language
                %th
                  User
                %th
                  Translations Count
                %th
                  Actions
            %tbody
              - @words.each do |word|
                %tr
                  %td=word.id
                  %td=word.content
                  %td=word.language.name
                  %td=word.user.secret_email
                  %td=word.translations.size
                  %td
                    = link_to('Show',word_url(word), class: 'btn btn-primary')
                    - if policy(word).edit?
                      = link_to('Edit',edit_word_url(word), class: 'btn btn-primary')
                    - if policy(word).destroy?
                      = link_to('Delete',
                        word_url(word), 
                        class: 'btn btn-primary', 
                        method: :delete, 
                        data: { confirm: 'Are you sure?' })
          = paginate @words, theme: 'twitter-bootstrap-4', pagination_class: "pagination-sm"
     

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

</details>   
  
### Vistas de la aplicación

<details>
     <summary> Ver Vistas... </summary> 
  
  
- Index principal de la aplicación, se puede observar que tiene contenido, lenguaje, usuario, la cantidad de traducciones y sus acciones.
  En la barra superior izquierda tiene el link para registrarse y para iniciar sesión.
    
![alt text](https://github.com/olperezf/words/blob/master/images/index.jpg?raw=true)
     
  
  
- Index cuando el usuario ha iniciado sesión, se puede observar que tienes las acciones de mostrar, editar y borrar palabra.
  En la barra superior izquierda se habilitó el link de crear nuevas palabras, continuar con el juego de palabras, 
  editar el perfil del registro y salir de la sesión.
  
![alt text](https://github.com/olperezf/words/blob/master/images/index_logueado.jpg?raw=true) 
  
- Pantalla para iniciar sesión
  
![alt text](https://github.com/olperezf/words/blob/master/images/login.jpg?raw=true) 
  
- Pantalla para registrarse
  
![alt text](https://github.com/olperezf/words/blob/master/images/register.jpg?raw=true)  
  
- Pantalla para registrar las palabras
  
![alt text](https://github.com/olperezf/words/blob/master/images/nueva_palabra.jpg?raw=true)
  
- Para observar esta vista seleccionar el link de continue game para jugar con el vocabulario.
  Aparecerá de manera aleatoria las palabras en español y luego colocar la palabra correcta en ingles.
  si incorrecta o buena la respuestas, se observará en las columnas respectivas, y  dependiendo de las
  respuestas se tiene el porcentaje de exactitud.
  
![alt text](https://github.com/olperezf/words/blob/master/images/game.jpg?raw=true)  
  
</details> 

### Introducción al Rspec

RSpec es una herramienta de prueba para Ruby. Es la biblioteca de pruebas más utilizada para Ruby en aplicaciones de producción, en esencia es una herramienta simple que puede comenzar a usar con bastante rapidez.

La idea del desarrollo impulsado por pruebas (TDD) fue llevada por primera vez a una audiencia más amplia por Kent Beck en su libro de 2000 Extreme Programming Explained. En lugar de escribir siempre pruebas para algún código que ya tenemos, trabajamos en un bucle rojo-verde:

- Escriba el caso de prueba más pequeño posible que coincida con lo que necesitamos programar.
- Ejecute la prueba y observe cómo falla. Esto le hace pensar en cómo escribir solo el código que lo hace pasar.
- Escribe un código para que la prueba pase.
- Ejecute su suite de pruebas. Repita los pasos 3 y 4 hasta que pasen todas las pruebas.
- Regrese y refactorice su nuevo código, haciéndolo lo más simple y claro posible mientras mantiene verde el conjunto de pruebas.

Este flujo de trabajo implica un "paso cero": tomarse el tiempo para pensar detenidamente qué es exactamente lo que necesitamos construir y cómo. Cuando siempre comenzamos con la implementación, es fácil perder el enfoque, escribir código innecesario y atascarse.

Para trabajar de una manera ordenada nos enfocamos en testear primero models, helpers y services. Y luego en controllers y feature tests para las views.

### Instalando Rspec

Consultar la Versión de la Gema: https://rubygems.org/gems/rspec-rails

- Añadir gem 'rspec-rails' en el archivo Gemfile:

          group :development, :test do
            gem 'rspec-rails', '~> 5.0.0'
          end
          
- Luego ejecutar en la consola para la instalación:

          $ bundle install
          
- Para generar los archivos de configuración estándar, ejecutar:

          $ rails generate rspec:install
               create  .rspec
               create  spec
               create  spec/spec_helper.rb
               create  spec/rails_helper.rb
 
Consultar para mayor informnación: https://github.com/rspec/rspec-rails

### Modelo - Rspec  ( Word )

La aplicación tiene varios modelos con sus pruebas. Para la explicación nos enfocaremos en el modelo Word

Cuando generamos un modelo por ejemplo Word (modelo de la aplicación), ejecutamos:

          $ rails g model Word
          .
          .
          invoke rspec
          create spec/models/word_spec.rb
          
Después de generar el modelo se observa que invoca rspec creando la ruta spec/models/word_spec.rb donde vamos a ejecutar nuestras pruebas

También cuando generamos el modelo nos crea el archivo de migración en db/migrate/xxxx_create_words.rb, y configuramos nuestro modelo:

    class CreateWords < ActiveRecord::Migration[6.1]
       def change
         create_table :words do |t|
           t.string :content    
           t.string :language 
           t.timestamps
         end
       end
    end
    
Luego migramos para crear nuestra tabla:

     $ rake db:migrate

Observamos el contenido del archivo spec/modelos/word_spec.rb:

          require 'rails_helper' 
          
          RSpec.describe Word, type: :model do
          
          end
          
Y el modelo app/models/word.rb

     Class Word < ApplicationRecord
     
     end
     
Para escribir nuestra primera linea de prueba, como por ejemplo que esté presente el atributo content del modelo Word; necesitamos de la ayuda de shoulda-matchers.

shoulda-matchers nos permitirá:

- Ahorrar tiempo: dedicar menos tiempo a escribir pruebas largas, complejas y propensas a errores.
- Escribir más pruebas: Probar a fondo utilizando más de 30 comparadores preexistentes, desarrollados a lo largo del tiempo.
- Resultados más legibles: Obtener mensajes claros, legibles y procesables de las pruebas que ejecuta.

Agregar en Gemfile la Gema y luego ejecutar bundle install:

     group :test do
       gem 'shoulda-matchers', '~> 5.0'
     end
     
Luego añadir en spec/rails_helper.rb el siguiente código:

     Shoulda::Matchers.configure do |config|
       config.integrate do |with|
         with.test_framework :rspec
         with.library :rails
       end
     end
     
Para mayor información: https://github.com/thoughtbot/shoulda-matchers
     
Continuamos..., vamos al archivo spec/modelos/word_spec.rb y agregamos:

     require 'rails_helper' 
          
     RSpec.describe Word, type: :model do
        describe 'columns' do
            it { is_expected.to have_db_column(:content) }
        end
     end
     
En este ejemplo observamos que tenemos una descripción columnas y escribimos nuestra primera prueba que especifica que se espera tener una columna llamada :content

Ahora el siguiente paso es ejecutar la prueba con los siguientes comandos:

- Para ejecutar la prueba unitaria o general de la aplicación ejecutamnos:

          $ rspec
  
  rspec ejecuta todo concerniente a modelos, controladores, servicios, etc...        

- Para ejecutar una prueba en especifico utilizamos rspec y la ruta del archivo:

          $ rspec spec/models/word_spec.rb
          
Ejecutando la prueba observamos la consola:

    Finished in 0.0241 seconds (files took 1.45 seconds to load)
    1 example, 0 failures  --> aquí se puede observar que tenemos un ejemplo ejecutado y todo salio en verde!!!
    
Ahora si ponemos una columna que no corresponda con el nombre verdadero, como por ejemplo pongamos ":valor": it { is_expected.to have_db_column(:valor) }, muestra el siguiente error:

     F

     Failures:

       1) Word columns is expected to have db column named valor
          Failure/Error: it { is_expected.to have_db_column(:valor) }
            Expected Word to have db column named valor (Word does not have a db column named valor.)
          # ./spec/models/word_spec.rb:5:in `block (3 levels) in <top (required)>'

     Finished in 0.04331 seconds (files took 1.43 seconds to load)
     1 example, 1 failure

     Failed examples:

     rspec ./spec/models/word_spec.rb:5 # Word columns is expected to have db column named valor
     
Hasta ahora se ha visto detalladamente como se ejecuta una prueba sencilla en el modelo. 
Las siguientes pruebas está basado en como validar, anidar y asociar modelos,atributos, etc... 
A continuación expondré la lógica del modelo Word con su modelo de prueba word_spec. Analizando:
  
- Modelo Word:

          class Word < ApplicationRecord
            belongs_to :language
            belongs_to :user

            has_many :translations_association, class_name: 'Translation', dependent: :destroy
            has_many :translations, through: :translations_association, source: :translated_word
            has_many :inverse_translations_association, class_name: 'Translation', foreign_key: 'translated_word_id', dependent: :destroy
            has_many :inverse_translations, through: :inverse_translations_association, source: :word

            validates :content, :language, presence: true
            validate :translations_cannot_be_in_the_same_language_as_word

            accepts_nested_attributes_for :translations, reject_if: :all_blank, allow_destroy: true 

            paginates_per 10

            private

            def translations_cannot_be_in_the_same_language_as_word 
              return if translations.none? { |translation| translation.language == language } 
              errors.add(:language, 'must be different than language of translations.') 
            end
          end 
          
 - Modelo word_spec:

          require 'rails_helper'

          RSpec.describe Word, type: :model do
            describe 'columns' do
              it { is_expected.to have_db_column(:valor) }
            end

            describe 'nested_attributes' do
              it { is_expected.to accept_nested_attributes_for(:translations).allow_destroy(true) }
            end

            describe 'associations' do
              it { is_expected.to belong_to(:language) }
              it { is_expected.to belong_to(:user) }
              it do 
                is_expected.to have_many(:translations_association)
                  .class_name('Translation')
                  .dependent(:destroy)
              end  
              it do 
                is_expected.to have_many(:translations)
                  .through(:translations_association)
                  .source(:translated_word)
                  # .class_name('Translation')
              end
              it do 
                is_expected.to have_many(:inverse_translations_association)
                  .class_name('Translation')
                  .with_foreign_key('translated_word_id')
                  .dependent(:destroy)
              end  
              it do 
                is_expected.to have_many(:inverse_translations)
                  .through(:inverse_translations_association)
                  .source(:word)
                  # .class_name('Translation')
              end
            end

            describe 'validations' do
              it { is_expected.to validate_presence_of(:content) }

              describe 'translations_cannot_be_in_the_same_language_as_word' do
                let(:language_1) { FactoryBot.create(:language) }
                let(:word_1) { FactoryBot.build(:word, language: language_1) }


                context 'when translations is in the same language' do
                  let(:word_2) { FactoryBot.build(:word, language: language_1) }
                  before do
                    word_1.translations = [word_2]
                  end
                  it do
                    expect(word_1).to be_invalid
                  end
                end

                context 'when translations is NOT in the same language' do
                  let(:language_2) { FactoryBot.create(:language, :spanish) }
                  let(:word_2) { FactoryBot.build(:word, language: language_2) }
                  before do
                    word_1.translations = [word_2]
                  end
                  it do
                    expect(word_1).to be_valid
                  end
                end

              end
              
Análisis:

En el modelo Word tenemos las siguientes asociaciones:

      belongs_to :language
      belongs_to :user

      has_many :translations_association, class_name: 'Translation', dependent: :destroy
      has_many :translations, through: :translations_association, source: :translated_word
      has_many :inverse_translations_association, class_name: 'Translation', foreign_key: 'translated_word_id', dependent: :destroy
      has_many :inverse_translations, through: :inverse_translations_association, source: :word
     
Y en el modelo word_spec lo validamos con la siguiente sintaxis:

     describe 'associations' do
     
        Para belongs_to :language 
          it { is_expected.to belong_to(:language) }
          
        Para belongs_to :user 
          it { is_expected.to belong_to(:user) }
        
        Para has_many :translations_association, class_name: 'Translation', dependent: :destroy 
          it do 
           is_expected.to have_many(:translations_association)
             .class_name('Translation')
             .dependent(:destroy)
          end 
          
        Para has_many :translations, through: :translations_association, source: :translated_word
          it do 
           is_expected.to have_many(:translations)
             .through(:translations_association)
             .source(:translated_word)
          end
          
        Para has_many :inverse_translations_association, class_name: 'Translation', foreign_key: 'translated_word_id', dependent: :destroy
          it do 
           is_expected.to have_many(:inverse_translations_association)
             .class_name('Translation')
             .with_foreign_key('translated_word_id')
             .dependent(:destroy)
          end 
          
        Para has_many :inverse_translations, through: :inverse_translations_association, source: :word
          it do 
           is_expected.to have_many(:inverse_translations)
             .through(:inverse_translations_association)
             .source(:word)
             # .class_name('Translation')
          end
     end
     
Se puede observar tambien que para escribir una prueba en una linea se utiliza: 

     it { ... }
   
En varias líneas:

     it do
       ...
     end
     
Para validar la anidación del siguiente código

     accepts_nested_attributes_for :translations, reject_if: :all_blank, allow_destroy: true
 
En word_spec su sintaxis es:

     describe 'nested_attributes' do
       it { is_expected.to accept_nested_attributes_for(:translations).allow_destroy(true) }
     end
     
Y por último tenemos en el modelo Word las validaciones:

     validates :content, :language, presence: true
     validate :translations_cannot_be_in_the_same_language_as_word
     
     private

     def translations_cannot_be_in_the_same_language_as_word 
       return if translations.none? { |translation| translation.language == language } 
       errors.add(:language, 'must be different than language of translations.') 
     end
     
Y en word_spec lo validamos:

       describe 'validations' do
       
        Para validates :content, :language, presence: true  (solo necesito que este presente :content)
        
         it { is_expected.to validate_presence_of(:content) }

        Para validate :translations_cannot_be_in_the_same_language_as_word
        
         describe 'translations_cannot_be_in_the_same_language_as_word' do
           let(:language_1) { FactoryBot.create(:language) }
           let(:word_1) { FactoryBot.build(:word, language: language_1) }

           En este contexto validamos cuando las traducciones esta en el mismo lenguaje 
           
           context 'when translations is in the same language' do
             let(:word_2) { FactoryBot.build(:word, language: language_1) }
             before do
               word_1.translations = [word_2]
             end
             it do
               expect(word_1).to be_invalid
             end
           end

           En este contexto validamos cuando las traducciones no están en el mismo lenguaje
           
           context 'when translations is NOT in the same language' do
             let(:language_2) { FactoryBot.create(:language, :spanish) }
             let(:word_2) { FactoryBot.build(:word, language: language_2) }
             before do
               word_1.translations = [word_2]
             end
             it do
               expect(word_1).to be_valid
             end
           end
           
         end
       end
       

Revisando el código de arriba nos encontramos con un una instrucción: FactoryBot, (anteriormente conocido como Factory Girl) es una Gema de biblioteca específica de Ruby. Crea accesorios de prueba, estos accesorios de prueba se pueden usar como una herramienta para ayudar con las pruebas automatizadas. “Un accesorio de prueba es un estado fijo de un conjunto de objetos que se utiliza como línea de base para ejecutar pruebas. El propósito es garantizar que exista un entorno bien conocido y fijo en el que se ejecuten las pruebas para que los resultados sean repetibles ".

En otras palabras, Factory Bot crea accesorios de prueba que son objetos de prueba falsos que se pueden reutilizar durante la prueba de una aplicación.

Los accesorios de prueba de Factory Bot le permite probar sus modelos y código sin tocar su base de datos. Factory Bot aún puede simular una base de datos muy de cerca con diferentes características de método.

Para instalar FactoryBot agregar en Gemfile la Gema y luego ejecutar bundle install:

     group :development, :test do
       gem 'factory_bot_rails'
     end
     
De forma predeterminada, factory_bot_rails cargará automáticamente las fábricas definidas en las siguientes ubicaciones, en relación con la raíz del proyecto Rails:

     factories.rb
     test/factories.rb
     spec/factories.rb
     factories/*.rb
     test/factories/*.rb
     spec/factories/*.rb
    
     
Para mayor información: https://github.com/thoughtbot/factory_bot_rails

Ahora si queremos crear nuestra fábrica de datos para las pruebas vamos a esta ruta spec/factories/ y creamos el archivo; en ésta aplicación podemos observar que tenemos varios archivos: game.rb, language.rb, user.rb y word.rb . Vamos a poner como ejemplo language.rb : 

     FactoryBot.define do
       factory :language do
         name { 'English' }

         trait :spanish do
           name { 'Spanish' }
         end
       end
     end
     
Los traits permiten agrupar atributos que se pueden aplicar a cualquier fábrica, por ejemplo, para hacer la llamada a éste Factory con su trait se escribe: 

     FactoryBot.create(:language, :spanish)

Continuamos... Explicación de varias líneas importantes dentro de 'translations_cannot_be_in_the_same_language_as_word'

     let(:language_1) { FactoryBot.create(:language) }
     
     let(:word_1) { FactoryBot.build(:word, language: language_1) }
     
     before do
       word_1.translations = [word_2]
     end

En FactoryBot.create(:language) -- > Creará el objeto de :language y todas las asociaciones para él. Todos se conservarán en la base de datos. Además, activará validaciones tanto del modelo como de la base de datos. 

En FactoryBot.build(:word, language: language_1) -- > No guardará el objeto :word, pero aún hará solicitudes a una base de datos si la fábrica tiene asociaciones en nuestro caso :language . Activará validaciones solo para objetos asociados.

La instrucción let(:language_1), let define un método auxiliar memorizado. El valor se almacenará en la variable :language_1, en caché en varias llamadas en el mismo bloque "it", pero no en varios bloques it. Tenga en cuenta que let tiene una evaluación diferida: no se evalúa hasta la primera vez que se invoca el método que define :language_1.

Instrucción before do es equivalente a before :each do : ejecuta el bloque una vez antes de cada una de sus especificaciones en el archivo.

Hasta aquí hemos visto lo básico y un poco más, concerniente a las pruebas basado en el Modelo.
