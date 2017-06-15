#!/usr/bin/sage

import numpy as np

def differentiation(d, N, mu, m, e, k):
#	phi = 0 #=0 for the migrant pool model, (1-m)^2 for the propagule pool model
	N = 2*N # converts in diploid individuals
	k = 2*k # converts in diploid individuals
	phi = 1.0/(k - 1.0) # charles' idea

	q1, q2 = var('q1, q2')
	a = (1-m)^2 + m^2/((1-e)*d - 1)
	b = (1-a) / ((1-e)*d - 1)
	A = 1/k + (1-1/k)*(phi*(q1+(1-q1)/k) + (1-phi)*q2) 
	B1 = (1/((1-e)*d)) * (q1 + (1-q1)/N) + (1 - 1/((1-e)*d))*q2
	C = (2*d*e*(1-e))/(d-1) + e*(d*e-1)/(d-1)

	eq1 = (1-mu)^2 * ( (1-e)*(a*(q1 + (1-q1)/N) + (1-a)*q2) + e*A) - q1 ==0
	eq2 = (1-mu)^2 * ( (1-e)*(1-e*d/(d-1)) * (b*(q1+(1-q1)/N) + (1-b)*q2) + C*B1) -q2 == 0

	res2 = solve([eq1, eq2], q1, q2)
	q1_est = res2[0][0]
	q2_est = res2[0][1]
	q = (1/d)*q1_est + (1-1/d)*q2_est
	Hs = 1 - q1_est
	Ht = 1 - q

	Fst_tmp = (1 - Hs/Ht)
	D_tmp = ((d/(d-1))*(Ht - Hs)/(1-Hs))
	Gstp_tmp = Fst_tmp / ((d-1)*(1-Hs)/(d-1+Hs))

	res = {}

	res['Fst'] = Fst_tmp.rhs().n()
	res['DJost'] = D_tmp.rhs().n()
	res['Gstp'] = Gstp_tmp.rhs().n()
	res['Hs'] = Hs.rhs().n()
	res['Ht'] = Ht.rhs().n()

	return(res)

header = "d\tN\tmu\te\tk\tm\tFst_mu_sage\tFst_noMu_sage\tDJost_mu_sage\tDJost_noMu_sage\tGstp_mu_sage\tGstp_noMu_sage\n"

d = 1000
N = 100
k = 1 
mu = 0.001

e_list = []
m_list = []
#for i in range(1, 6, 1):
#	for j in np.arange(1, 10, 0.2):
#		e_list.append(j*10**-i)
#		m_list.append(j*10**-i)
for i in np.arange(0, 0.005, 0.3):
	for j in np.arange(0, 10, 0.3):
		e_list.append(j*10**-i)
		m_list.append(j*10**-i)


#for i in np.arange(0, 1, 0.001):
#	e_list.append(i)
#	m_list.append(i)

e_list.append(0)
#e_list.append(1)
e_list.sort()

m_list.append(0)
m_list.append(1)
m_list.sort()

res_fst = ""
res_D = ""
res_gstp = ""
res_fstCoal = ""
res_Hs = ""
res_Ht = ""

for m in m_list:
	res_fst += "\t{0}".format(float(m))
	res_D += "\t{0}".format(float(m))
	res_gstp += "\t{0}".format(float(m))
	res_fstCoal += "\t{0}".format(float(m))
	res_Hs += "\t{0}".format(float(m))
	res_Ht += "\t{0}".format(float(m))
res_fst += "\n"
res_D += "\n"
res_gstp += "\n"
res_fstCoal += "\n"
res_Hs += "\n"
res_Ht += "\n"
 
for e in e_list:
	res_fst += "\n{0}\t".format(float(e))
	res_D += "\n{0}\t".format(float(e))
	res_gstp += "\n{0}\t".format(float(e))
	res_fstCoal += "\n{0}\t".format(float(e))
	res_Hs += "\n{0}\t".format(float(e))
	res_Ht += "\n{0}\t".format(float(e))
	for m in m_list:
		print("m={0}\te={1}".format(m, e))
		tmp_mu = differentiation(d, N, mu, m, e, k)
		tmp_noMu = differentiation(d, N, 1e-12, m, e, k)
		res_fst += "{0}\t".format(tmp_mu['Fst'] )
		res_D += "{0}\t".format(tmp_mu['DJost'] )
		res_gstp += "{0}\t".format(tmp_mu['Gstp'] )
		res_fstCoal += "{0}\t".format(tmp_noMu['Fst'] )
		res_Hs += "{0}\t".format(tmp_noMu['Hs'] )
		res_Ht += "{0}\t".format(tmp_noMu['Ht'] )

outfile = open("fig_e_i_fst.txt", "w")
outfile.write(res_fst)
outfile.close()

outfile = open("fig_e_i_D.txt", "w")
outfile.write(res_D)
outfile.close()

outfile = open("fig_e_i_gstp.txt", "w")
outfile.write(res_gstp)
outfile.close()

outfile = open("fig_e_i_fstCoal.txt", "w")
outfile.write(res_fstCoal)
outfile.close()

outfile = open("fig_e_i_Hs.txt", "w")
outfile.write(res_Hs)
outfile.close()

outfile = open("fig_e_i_Ht.txt", "w")
outfile.write(res_Ht)
outfile.close()

