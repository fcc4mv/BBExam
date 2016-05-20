from system.core.model import Model
import re
import bcrypt

class Quote(Model):
	def __init__(self):
		super(Quote, self).__init__()

	def add(self, quote_info):
		
		if len(quote_info['author']) < 3:
			errors.append('Name field requires a minimum of 3 characters')
		elif len(quote_info['content']) < 10:
			errors.append('Message field requires a minimum of 10 characters and no numbers')
		if errors:
			return{'status': False, 'errors': errors}
		else:
			query = 'INSERT INTO quotes (user_id, author, content, created_at, modified_at) VALUES(:user_id, :author, :content, NOW(), NOW())'
			data = {
				'user_id': quote_info['user_id'],
				'author': quote_info['author'],
				'content': quote_info['content'],
			}
			print "hello"
			self.db.query_db(query, data)
			get_user_query = 'SELECT * FROM users ORDER BY id DESC LIMIT 1'
			users = self.db.query_db(get_user_query)
			print users
			return { 'status': True, 'users': users[0] }

	# def login(self, user_login):
	# 	password = user_login['password']
	# 	errors = []

	# 	query = "SELECT * FROM users WHERE email=:email LIMIT 1"
	# 	data = {
	# 		'email':user_login['email']
	# 		}
	# 	db_email = self.db.query_db(query, data)

	# 	if not db_email:
	# 		errors.append('Email not found')
	# 		return{'status': False, 'errors': errors}
	# 	elif self.bcrypt.check_password_hash(db_email[0]['password'], password):
	# 		print 'inside elif'
	# 		return{'status': True, 'users': db_email[0]}
	# 	else:
	# 		print 'inside else'
	# 		errors.append('Password is wrong')
	# 		return{'status': False, 'errors': errors}
