from system.core.controller import *
import re
EMAIL_REGEX = re.compile(r'^[a-zA-Z0-9\.\+_-]+@[a-zA-Z0-9\._-]+\.[a-zA-Z]*$')

class Admins(Controller):
	def __init__(self, action):
		super(Admins, self).__init__(action)
		self.load_model('Admin')

	def index(self):
		return self.load_view('index.html')

	def register(self):
		user_info = {
			'name': request.form['name'],
			'alias': request.form['alias'],
			'email': request.form['email'],
			'password': request.form['password'],
			'pw_confirm': request.form['pw_confirm']
		}

		create_status = self.models['Admin'].register(user_info)
		if create_status['status'] == True:
			session['id'] = create_status['users']['id']
			session['name'] = create_status['users']['name']
			session['alias'] = create_status['users']['alias']
			return self.load_view('dashboard.html')
		else:
			for message in create_status['errors']:
				flash(message, 'reg_errors')
			return redirect('/')

	def login(self):
		user_login = {
			'email': request.form['email'],
			'password': request.form['password']
			}

		create_login = self.models['Admin'].login(user_login)
		if create_login['status'] == True:
			session['id'] = create_login['users']['id']
			session['name'] = create_login['users']['name']
			session['alias'] = create_login['users']['alias']
			return self.load_view('dashboard.html')
		else:
			for message in create_login['errors']:
				flash(message, 'login_errors')
			return redirect('/')

