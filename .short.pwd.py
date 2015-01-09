import os
pwd = os.getcwd()
if len(pwd) > 30:
	pwd = '...'+pwd[-30:]
print '[%s]' % (pwd)
