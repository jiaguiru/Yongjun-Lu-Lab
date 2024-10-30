install.packages("pROC") # 下载 pROC 包
install.packages("ggplot2") # 下载 ggplot2 包
library(pROC) # 加载pROC包
library(ggplot2) # 调用ggplot2包以利用ggroc函数
#清理工作环境
rm(list = ls()) 
#3.读入数据
aa<- read.csv('HC-CSVD ROC.csv')

#分开画roc1
roc1 <- roc(aa$aCSVD,aa$Blautia_luti);roc1

plot(roc1,
     
     max.auc.polygon=FALSE, # 填充整个图像
     
     smooth=F, # 绘制不平滑曲线
     
     main="Comparison of ROC curves", # 添加标题
     
     col="red", # 曲线颜色为红色
     
     legacy.axes=TRUE) # 使横轴从0到1，表示为1-特异度

legend(0.6,0.2,
       
       legend = c("Blautia_luti AUC=0.6789"),
       
       col = c("red"),
       
       lwd = 2,cex = 0.8)

#分开画roc2
roc2 <- roc(aa$aCSVD,aa$Flavonol);roc2

plot(roc2,
     
     max.auc.polygon=FALSE, # 填充整个图像
     
     smooth=F, # 绘制不平滑曲线
     
     main="Comparison of ROC curves", # 添加标题
     
     col="orange", # 曲线颜色为红色
     
     legacy.axes=TRUE) # 使横轴从0到1，表示为1-特异度

legend(0.6,0.2,
       
       legend = c("Flavonol AUC=0.6356"),
       
       col = c("orange"),
       
       lwd = 2,cex = 0.8)

#合在一起画
roc1 <- roc(aa$aCSVD,aa$Blautia_luti);roc1

roc2 <- roc(aa$aCSVD,aa$Flavonol);roc2

plot(roc1,
     
     max.auc.polygon=FALSE, # 填充整个图像
     
     smooth=F, # 绘制不平滑曲线
     
     main="Comparison of ROC curves", # 添加标题
     
     col="red", # 曲线颜色为红色
     
     legacy.axes=TRUE) # 使横轴从0到1，表示为1-特异度
plot.roc(roc2,
         
         add=T, # 增加曲线
         
         col="orange", # 曲线颜色为橙色
         
         smooth = F) # 绘制不平滑曲线
legend(0.6,0.2,
       
       legend = c("Blautia_luti AUC=0.6789","Flavonol AUC=0.6356"),
       
       col = c("red","orange"),
       
       lwd = 2,cex = 0.8)


