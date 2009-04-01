#
# Brazilian Rails Template
# Author: Rafael Uchôa
# http://putshelloworld.wordpress.com/
#

#
# Feel free to fork it!
#

# Rewrite environment.rb to config the timezone and i18n
# THIS BLOCK SHOULD BE FIRST OF ALL
file "config/environment.rb", <<-ENV 
 RAILS_GEM_VERSION = '2.3.2' unless defined? RAILS_GEM_VERSION

 require File.join(File.dirname(__FILE__), 'boot')

 Rails::Initializer.run do |config|
   
  config.time_zone = 'Brasilia'
  config.i18n.default_locale = 'pt-BR'
 end

ENV


# Brazilian-Rails
# sudo gem install brazilian-rails
# (for more details, see http://github.com/tapajos/brazilian-rails/tree/master )
gem "brdinheiro",       :version => ">= 2.1.6"
gem "brazilian-rails",  :version => ">= 2.1.6"
gem "brcep",            :version => ">= 2.1.6"
gem "brcpfcnpj",        :version => ">= 2.1.6"
gem "brdata",           :version => ">= 2.1.6"
gem "brdinheiro",       :version => ">= 2.1.6"
gem "brhelper",         :version => ">= 2.1.6"
gem "brnumeros",        :version => ">= 2.1.6"
gem "brstring",         :version => ">= 2.1.6"


# Initialize git
git :init

# Uchoaaa's activerecord_i18n_defaults
# (for more details, see http://github.com/uchoaaa/activerecord_i18n_defaults/tree/master )
plugin "activerecord_i18n_defaults", 
 :git => "git://github.com/uchoaaa/activerecord_i18n_defaults.git", 
 :submodule => true

# i18n pt-BR.yml  
# (for more details, see http://github.com/svenfuchs/rails-i18n/tree/master )
file "config/locales/pt-BR.yml", <<-CODE
pt-BR:
  # formatos de data e hora
  date:
    formats:
      default: "%d/%m/%Y"
      short: "%d de %B"
      long: "%d de %B de %Y"
      only_day: "%d"

    day_names: [Domingo, Segunda, Terça, Quarta, Quinta, Sexta, Sábado]
    abbr_day_names: [Dom, Seg, Ter, Qua, Qui, Sex, Sáb]
    month_names: [~, Janeiro, Fevereiro, Março, Abril, Maio, Junho, Julho, Agosto, Setembro, Outubro, Novembro, Dezembro]
    abbr_month_names: [~, Jan, Fev, Mar, Abr, Mai, Jun, Jul, Ago, Set, Out, Nov, Dez]
    order: [:day,:month,:year]

  time:
    formats:
      default: "%A, %d de %B de %Y, %H:%M hs"
      time: "%H:%M hs"
      short: "%d/%m, %H:%M hs"
      long: "%A, %d de %B de %Y, %H:%M hs"
      only_second: "%S"
      datetime:
        formats:
          default: "%Y-%m-%dT%H:%M:%S%Z"
    am: ''
    pm: ''

  # date helper distancia em palavras
  datetime:
    distance_in_words:
      half_a_minute: 'meio minuto'
      less_than_x_seconds:
        one: 'menos de 1 segundo'
        other: 'menos de {{count}} segundos'

      x_seconds:
        one: '1 segundo'
        other: '{{count}} segundos'

      less_than_x_minutes:
        one: 'menos de um minuto'
        other: 'menos de {{count}} minutos'

      x_minutes:
        one: '1 minuto'
        other: '{{count}} minutos'

      about_x_hours:
        one: 'aproximadamente 1 hora'
        other: 'aproximadamente {{count}} horas'

      x_days:
        one: '1 dia'
        other: '{{count}} dias'

      about_x_months:
        one: 'aproximadamente 1 mês'
        other: 'aproximadamente {{count}} meses'

      x_months:
        one: '1 mês'
        other: '{{count}} meses'

      about_x_years:
        one: 'aproximadamente 1 ano'
        other: 'aproximadamente {{count}} anos'

      over_x_years:
        one: 'mais de 1 ano'
        other: 'mais de {{count}} anos'

  # numeros
  number:
    format:
      precision: 3
      separator: ','
      delimiter: '.'
    currency:
      format:
        unit: 'R$'
        precision: 2
        format: '%u %n'
        separator: ','
        delimiter: '.'
    percentage:
      format:
        delimiter: '.'
    precision:
      format:
        delimiter: '.'
    human:
      format:
        precision: 1
        delimiter: '.'
  support:
    array:
      sentence_connector: "e"
      skip_last_comma: true

  # Active Record
  activerecord:
    attributes:
      _all:
        created_at: "Data de Criação"
        updated_at: "Data de Atualização"
    # your_model:
    #   model_attr: "Nice Name"
    errors:
      template:
        header:
          one: "{{model}} não pôde ser salvo: 1 erro"
          other: "{{model}} não pôde ser salvo: {{count}} erros."
        body: "Por favor, cheque os seguintes campos:"
      messages:
        inclusion: "não está incluso na lista"
        exclusion: "não está disponível"
        invalid: "não é válido"
        confirmation: "não bate com a confirmação"
        accepted: "precisa ser aceito"
        empty: "não pode ser vazio"
        blank: "não pode ser vazio"
        too_long: "é muito longo (não mais do que {{count}} caracteres)"
        too_short: "é muito curto (não menos do que {{count}} caracteres)"
        wrong_length: "não é do tamanho correto (precisa ter {{count}} caracteres)"
        taken: "não está disponível"
        not_a_number: "não é um número"
        greater_than: "precisa ser maior do que {{count}}"
        greater_than_or_equal_to: "precisa ser maior ou igual a {{count}}"
        equal_to: "precisa ser igual a {{count}}"
        less_than: "precisa ser menor do que {{count}}"
        less_than_or_equal_to: "precisa ser menor ou igual a {{count}}"
        odd: "precisa ser ímpar"
        even: "precisa ser par"  
CODE


# Config GIT
# (for more details, see http://gist.github.com/88502 )
file '.gitignore', <<-CODE
log/*.log
log/*.pid
db/*.db
db/*.sqlite3
db/schema.rb
tmp
.DS_Store
doc/api
doc/app
config/database.yml
CODE

# TIP: Never commit your database.yml!
run "cp config/database.yml config/database.yml.sample"

# Initialize submodules
git :submodule => "init"

git :add => "."

git :commit => "-a -m 'Initial commit. (Copy config/database.yml.sample to config/database.yml and customize.)'"
