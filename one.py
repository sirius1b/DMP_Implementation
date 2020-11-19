import numpy as np
import matplotlib.pyplot as plt
import copy 

def least_sq(A,b):
	return np.matmul(np.matmul(np.linalg.inv(np.matmul(A.T,A)),A.T),b)

def get_gaussians(s,c,h,n,f_s): #equally spaced gaussian basis
	Cs = np.arange(1,n+1)*(c/n)
	f_s.shape = (f_s.shape[0],1)
	s.shape = (s.shape[0],1)
	sn = np.tile(s,(1,n))
	Csn = np.tile(Cs,(s.shape[0],1))
	K = np.exp(-h*(sn-Csn)**2)
	plt.subplot(2,2,1)
	for i in range(n):
		plt.plot(s,K[:,i],label="basis "+str(i))
	plt.legend()

	K1 = copy.deepcopy(K)

	# linear least squares
	for i in range(len(s)):
		K[i,:] = K[i,:]*s[i]/sum(K[i,:])
	wi_lq = least_sq(K,f_s)
	f_new = np.matmul(K,wi_lq)
	
	#lWR
	S = s
	wi_lw = np.ones(n)
	for i in range(n):
		qsi_mat = np.diag(K1[:,i])
		# print(qsi_mat.shape,S.shape,f_s.shape)
		wi_lw[i] = np.matmul(np.matmul(S.T,qsi_mat),f_s)/np.matmul(np.matmul(S.T,qsi_mat),S)

	
	print(wi_lw)
	print(wi_lq)
	f_lwr = np.matmul(K,wi_lw)
	plt.subplot(2,2,2)
	# plt.plot(s,f_new,label='f_new')
	plt.plot(s,f_s,label='f_s')
	plt.plot(s,f_lwr,label='f_lwr')
	plt.legend()
	# plt.show()


def dmp(x,xd,xdd,t0,tf,td,t):
	tau = tf - t0;
	v = xd*tau
	vd = xdd*tau
	K = 1; D = np.sqrt(4*K);
	g = y[len(y) - 1];
	x0 = y[0];
	f_s = (-K*(g - x) + D*v + tau*vd)/(g-x0)

	alp = 1
	s = np.exp(-alp*t/tau)

	ft = get_gaussians(s,1,1000,50,f_s)

	#-------------------


	# plt.subplot(2,2,1)
	# plt.plot(t,x)
	
	# plt.subplot(2,2,2)
	# plt.plot(t,v)
	# plt.plot(t,xd)

	# plt.subplot(2,2,3)
	# plt.plot(t,vd)
	# plt.plot(t,xdd)

	# plt.subplot(2,2,4)
	# # plt.plot(t,f_s,label='fs')
	# plt.plot(t,s,label='s')

	# plt.legend()

	plt.show()



def derivate_bk(y,td):
	yd = [0]
	for i in range(1,len(y)):
		yd.append((y[i] - y[i-1])/td)
	yd[0] = yd[1]
	return np.array(yd)

if __name__ == '__main__':
	
	## some parameters
	t0 = 1 ; tf = 10; td = 0.05;
	t = np.arange(t0,tf,td)
	# y = list(map(lambda x: 1 if x>2.5 else 0 , t))
	a = 3;
	y = np.array(7.2*t**2 + 16*t -0.43)
	# y = np.sin(a*t)
	yd = derivate_bk(y,td)
	ydd = derivate_bk(yd,td)

	# plt.plot(t,y,'r')
	# plt.plot(t,yd,'b')
	# plt.plot(t,ydd,'g')
	# plt.show()
	

	dmp(y,yd,ydd,t0,tf,td,t)




