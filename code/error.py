import matplotlib.pyplot as plt
import numpy as np
t = [546,1149,2858,6635]
t = [x/60 for x in t]
e = [75,76,72,71]
cd = [0.386,0.387,0.379,0.376]
m = [265391, 549497, 1204214, 1459630]
fig,ax = plt.subplots()
ax.plot(m,t,color='r',label='time')
ax.set_ylabel('time [minutes]')
ax.set_xlabel('mesh [cells]')
ax.spines['right'].set_visible(False)
z_ax = ax.twinx()
z_ax.plot(m,e,label = r"error for $c_d$")
z_ax.set_ylabel('error %')
k_ax = ax.twinx()
k_ax.spines['right'].set_position(('data',1600000))
k_ax.plot(m,cd,color='b',label=r"$c_d$")
k_ax.set_ylabel(r"$c_d$")
fig.legend()
plt.show()
