from system.core.controller import *
import re

class Quotes(Controller):
	def __init__(self, action):
		super(Quotess, self).__init__(action)
		self.load_model('Quote')

	def index(self):
		return self.load_view('dashboard.html')

	def add(self):
		quote_info = {
			'user_id': request.form['user_id'],
			'author' request.form['author'],
			'content': request.form['content'],
		}

		create_status = self.models['Quote'].register(quote_info)
		if create_status['status'] == True:
			session['user_id'] = create_status['quotes']['user_id']
			session['author'] = create_status['quotes']['author']
			session['content'] = create_status['quotes']['content']
			return self.load_view('dashboard.html')
		else:
			for message in create_status['errors']:
				flash(message, 'reg_errors')
			return redirect('/')

	# def login(self):
	# 	user_login = {
	# 		'email': request.form['email'],
	# 		'password': request.form['password']
	# 		}

	# 	create_login = self.models['Admin'].login(user_login)
	# 	if create_login['status'] == True:
	# 		session['id'] = create_login['users']['id']
	# 		session['name'] = create_login['users']['name']
	# 		session['alias'] = create_login['users']['alias']
	# 		return self.load_view('dashboard.html')
	# 	else:
	# 		for message in create_login['errors']:
	# 			flash(message, 'login_errors')
	# 		return redirect('/')

