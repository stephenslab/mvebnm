set.seed(1)
n <- 400
V <- rbind(c(0.8,0.2),
           c(0.2,1.5))
U <- list(none   = rbind(c(0,0),
                         c(0,0)),
          shared = rbind(c(1.0,0.9),
                         c(0.9,1.0)),
          only1  = rbind(c(1,0),
                         c(0,0)),
          only2  = rbind(c(0,0),
                         c(0,1)))
w <- c(0.8,0.1,0.075,0.025)
rownames(V) <- c("d1","d2")
colnames(V) <- c("d1","d2")
X <- simulate_ud_data(n,w,U,V)
numiter <- 40
control <- list(maxiter = numiter,
                resid.update = "none",
                scaled.update = "none",
                rank1.update = "ed",
                unconstrained.update = "ed",
                version = "R")
fit1 <- ud_init(X,
                U_scaled = U,
                U_rank1 = list(tcrossprod(c(-1,1)),tcrossprod(c(1,2))),
                n_unconstrained = 2,
                V = V,control = control)
fit2 <- fit1
# fit2$V <- rep(list(fit2$V),n)
control1 <- control
control2 <- control
control1$scaled.update <- "none"
control2$scaled.update <- "em"
fit1 <- ud_fit(fit1,control = control1)
fit2 <- ud_fit(fit2,control = control2)
y1 <- fit1$progress$loglik
y2 <- fit2$progress$loglik
y0 <- max(c(y1,y2))
y1 <- y0 - y1 + 0.01
y2 <- y0 - y2 + 0.01
plot(1:numiter,y1,col = "darkblue",type = "l",lwd = 2,
     log = "y",xlab = "iteration",ylab = "loglik difference",
     ylim = c(0.01,max(c(y1,y2))))
lines(1:numiter,y2,col = "tomato",lty = "dashed",lwd = 2)

