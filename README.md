# Deploy NocoDB to GetUp Heroku

Since Heroku only rebuilds apps when a new commit is pushed to the
repo, upgrade NocoDB by updating the `FROM` line in `Dockerfile` to
the version you want to deploy, commit that, then push it to the
heroku app.
