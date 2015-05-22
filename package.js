Package.describe({
  git: 'https://github.com/zimme/meteor-email-helpers.git',
  name: 'zimme:email-helpers',
  summary: 'Helpers to make managing emails easier',
  version: '0.1.0'
});

Package.onUse(function(api) {
  api.versionsFrom('1.1.0.2');

  api.use([
    'accounts-base',
    'coffeescript'
  ]);

  api.addFiles('lib/email-helpers.coffee');
});

Package.onTest(function(api) {
  api.use([
    'coffeescript'
    'tinytest'
  ]);

  api.use('zimme:email-helpers');

  api.addFiles('tests/email-helpers.coffee');
});
