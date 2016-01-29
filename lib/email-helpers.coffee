patterns =
  email:
    address: String
    primary: Match.Optional Boolean
    verified: Match.Optional Boolean

  regEx:
    email: /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/

  user:
    _id: String

Accounts.addEmail = (email, userOrCallback = Meteor.userId(), callback) ->
  check email, Match.OneOf String, patterns.email
  check userOrCallback, Match.Optional Match.OneOf Function, null, String,
    Match.ObjectIncluding patterns.user
  check callback, Match.Optional Function

  if Match.test email, String
    email =
      address: email

  unless email.address.search patterns.regEx.email > -1
    throw new Error 'You need to provide a valid email address.'

  if Match.test userOrCallback, null
    throw new Error 'You need to provide a user if you\'re not logged in.'

  else if Match.test userOrCallback, Function
    callback = userOrCallback

  else if Match.test userOrCallback, String
    userOrCallback =
      _id: userOrCallback

  # XXX: continue

  return
