

par_d_k = getDiff("Kannada",2,FALSE)
par_s_k = getDiff("Kannada",5,FALSE)
par_e_k = getDiff("Kannada",6,FALSE)

para_c_k = data.frame(D = par_d_k$diff, Ts = par_s_k$diff, Te = par_e_k$diff, char = par_s_k$lab,
                      script = par_s_k$Script)

gpd_k <- ggparcoord(data = para_c_k,columns = c(1:3),scale="center",groupColumn = 4,order=c(3,1,2))
print(gpd_k)

par_d_t = getDiff("Tamil",2,FALSE)
par_s_t = getDiff("Tamil",5,FALSE)
par_e_t = getDiff("Tamil",6,FALSE)

para_c_t = data.frame(D = par_d_t$diff, Ts = par_s_t$diff, Te = par_e_t$diff, char = par_s_t$lab,
                      script = par_s_t$Script)

gpd_t <- ggparcoord(data = para_c_t,columns = c(1:3),scale="center",groupColumn = 4,order=c(3,1,2))
print(gpd_t)

para_c = rbind(para_c_k,para_c_t)

gpd <- ggparcoord(data = para_c,columns = c(1:3),scale="center",groupColumn = 5,order=c(3,1,2))
print(gpd)
