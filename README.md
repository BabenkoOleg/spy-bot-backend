# Spy Bot Backend
This is a bot that checks for new work on Upwork and sends these works to the Slack channel.

## Installation
```
$ git clone git@github.com:BabenkoOleg/spy-bot-backend.git
$ cd spy-bot-backend
```

Also you must create an empty database in Postgresql with the name `spy_bot`

To launch the application you need to provide the configuration file at `config/environment.yml`. Here is an example of the contents:

```yml
production:
  sequel_database: 'spy_bot'
  sequel_adapter: 'postgres'
  sequel_max_connections: '10'
  sequel_log_file_path: 'log/sequel.log'

  upwork_api_consumer_key:
  upwork_api_consumer_secret:
  upwork_api_access_token:
  upwork_api_access_secret:
  upwork_api_signature_method: 'HMAC-SHA1'

  slack_api_client_token:
  slack_api_client_channel:
```

## Launching
To start the parser of works, execute in the application folder:

```
$ sidekiq -C config/sidekiq.yml -d -g "spy-bot"
```

To start the Sidekiq web interface run:
```
$ puma -C config.ru
```
After that, the web interface will be available on `0.0.0.0:9292/sidekiq`

## Configuration
To manage search queries, you must create/edit the file `config/search.yml`

```yml
- searching:
    skills: 'angular'
  processing:
    excepted_skills: 'php, wordpress'
- searching:
    skills: 'rails'
  processing:
    excepted_skills: 'php, wordpress'
- searching:
    q: 'angular'
  processing:
    excepted_skills: 'php, wordpress'
- searching:
    q: 'rails'
  processing:
    excepted_skills: 'php, wordpress'
- searching:
    q: 'ruby'
  processing:
    excepted_skills: 'php, wordpress'
- searching:
    q: 'javascript'
  processing:
    excepted_skills: 'php, wordpress'
```

You can find out more about the configuration file in the example `search.example.yml`.
