from fabric.api import *
from fabric.contrib.project import rsync_project
from fabric.operations import local as lrun
from unipath import Path

ACTIVATE = 'source {0}/bin/activate'
UPDATE_REQS = '{0} install -r {1}requirements/{2}.txt'
MANAGE = '{0} manage.py '
COLLECT_STATIC = 'collectstatic --noinput --settings {0}.settings.{1}'
SYNCDB = 'syncdb --settings {0}.settings.{1}'
MIGRATE = 'migrate --settings {0}.settings.{1}'


@task
def local():
    env.run = lrun
    env.cd = lcd
    env.name = 'local'
    env.hosts = ['localhost']
    env.path = Path(__file__).ancestor(1) + "/"
    env.project = 'fairplay'
    env.virtualenv = 'virtualenv -p python3'
    env.environment = env.path + 'venv'
    env.python = 'python'
    env.pip = 'pip'
    env.manage = MANAGE.format(env.python)
    env.restart = ('echo "You must use manage.py runserver"',)


@task
def production():
    env.run = run
    env.cd = cd
    env.user = 'fairland'
    env.name = 'production'
    env.hosts = ['scores.fairlandboysgymnastics.org']
    env.path = '/srv/fairplay/'
    env.project = 'fairplay'
    env.virtualenv = 'virtualenv -p python3'
    env.environment = env.path + 'venv'
    env.warn_only = True
    env.python = 'source {0}venv/bin/activate && python'.format(env.path)
    env.pip = 'source {0}venv/bin/activate && pip'.format(env.path)
    env.manage = MANAGE.format(env.python)
    env.restart = ('sudo systemctl restart uwsgi',
                   'sudo systemctl restart nginx',)

@task
def bootstrap():
    upload()
    env.cd(env.path)
    env.run('rm -rf {0}'.format(env.environment))
    env.run('mkdir -p {0}'.format(env.environment))
    env.run('{0} {1} --no-site-packages'.format(
        env.virtualenv, env.environment))
    update_requirements()


@task
def upload():
    if 'localhost' not in env.hosts:
        extra_opts = '--omit-dir-times'
        put('requirements', env.path)

        rsync_project(remote_dir=env.path,
                      local_dir=env.project,
                      delete=True,
                      extra_opts=extra_opts,
                      exclude=('{0}/local_static/'.format(env.project),
                               '{0}/local_media/'.format(env.project),
                               '{0}/local_logs/'.format(env.project),
                               '*.pyc',
                               '*.pyo',
                               '__pycache__',))


@task
def update_requirements():
    with prefix(ACTIVATE.format(env.environment)):
        env.run(UPDATE_REQS.format(env.pip, env.path, env.name))


@task
def collectstatic():
    with env.cd(env.path + env.project):
        with prefix(ACTIVATE.format(env.environment)):
            env.run(env.manage + COLLECT_STATIC.format(env.project, env.name))


@task
def migrate():
    with env.cd(env.path + env.project):
        with prefix(ACTIVATE.format(env.environment)):
            env.run(env.manage + MIGRATE.format(env.project, env.name))


@task
def restart():
    with settings(warn_only=True):
        for cmd in env.restart:
            env.run(cmd)


@task
def shell():
    lrun('ssh {}@{} '.format(env.user, env.hosts[0]))


@task
def deploy():
    upload()
    collectstatic()
    migrate()
    restart()
