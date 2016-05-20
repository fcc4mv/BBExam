from system.core.model import Model
import re
import bcrypt

class Admin(Model):
	def __init__(self):
		super(Admin, self).__init__()

	def register(self, user_info):
		password = user_info['password']
		hashed_pw = self.bcrypt.generate_password_hash(password)

		EMAIL_REGEX = re.compile(r'^[a-zA-Z0-9\.\+_-]+@[a-zA-Z0-9\._-]+\.[a-zA-Z]*$')
		errors = []
	
		if len(user_info['name']) < 2:
			errors.append('Name field requires a minimum of 2 characters and no numbers')
		elif user_info['name'].isdigit() == True:
			errors.append('Name field requires a minimum of 2 characters and no numbers')
		elif len(user_info['alias']) < 2:
			errors.append('Name field requires a minimum of 2 characters and no numbers')
		elif user_info['alias'].isdigit() == True:
			errors.append('Name field requires a minimum of 2 characters and no numbers')
		if not user_info['email']:
			errors.append('Please enter a valid email address')
		elif not EMAIL_REGEX.match(user_info['email']):
			errors.append('Please enter a valid email address')
		elif len(user_info['password']) < 8:
			errors.append('Password requires a minimum of 8 characters')
		elif user_info['password'] != user_info['pw_confirm']:
			errors.append('Password does not match')
		if errors:
			return{'status': False, 'errors': errors}
		else:
			query = 'INSERT INTO users (name, alias, email, password, created_at, modified_at) VALUES(:name, :alias, :email, :password, NOW(), NOW())'
			data = {
				'name': user_info['name'],
				'alias': user_info['alias'],
				'email': user_info['email'],
				'password': hashed_pw
			}
			print "hello"
			self.db.query_db(query, data)
			get_user_query = 'SELECT * FROM users ORDER BY id DESC LIMIT 1'
			users = self.db.query_db(get_user_query)
			print users
			return { 'status': True, 'users': users[0] }

	def login(self, user_login):
		password = user_login['password']
		errors = []

		query = "SELECT * FROM users WHERE email=:email LIMIT 1"
		data = {
			'email':user_login['email']
			}
		db_email = self.db.query_db(query, data)

		if not db_email:
			errors.append('Email not found')
			return{'status': False, 'errors': errors}
		elif self.bcrypt.check_password_hash(db_email[0]['password'], password):
			print 'inside elif'
			return{'status': True, 'users': db_email[0]}
		else:
			print 'inside else'
			errors.append('Password is wrong')
			return{'status': False, 'errors': errors}
