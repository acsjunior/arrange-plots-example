library(ggplot2)
library(ggpubr)


# Carregando o conjunto de dados
data(mpg)


# Criando 3 gráficos independentes
plot1 <- ggplot(mpg, aes(x = cty, y = hwy, color = class)) +
  geom_point(alpha = 0.7, size = 2) +
  geom_smooth(method = "loess", color = "red") +
  labs(x = "Consumo na cidade", y = "Consumo na estrada", color = "Categoria") +
  theme(axis.title = element_text(size = 10, face = "bold"),
        axis.text = element_text(size = 8),
        legend.title = element_text(size = 10, face = "bold"),
        legend.text = element_text(size = 8)); plot1

plot2 <- ggplot(mpg, aes(x = cty, fill = class)) +
  geom_histogram(bins = 15, alpha = 0.7, color = "dark gray") +
  labs(x = "Consumo na cidade", y = "Frequência", fill = "Categoria") +
  theme(axis.title = element_text(size = 10, face = "bold"),
        axis.text = element_text(size = 8),
        legend.title = element_text(size = 10, face = "bold"),
        legend.text = element_text(size = 8)); plot2

plot3 <- ggplot(mpg, aes(x = manufacturer, fill = class)) +
  geom_bar(alpha = 0.7, color = "dark gray") +
  labs(x = "Fabricante", y = "Frequência", fill = "Categoria") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1),
        axis.text = element_text(size = 8),
        axis.title = element_text(size = 10, face = "bold"),
        legend.title = element_text(size = 10, face = "bold"),
        legend.text = element_text(size = 8)); plot3


# Combinando os gráficos
graficos_combinados <- ggarrange(plot1, plot2, plot3 + rremove("x.text"), 
                                 ncol = 1, nrow = 3,
                                 common.legend = TRUE, legend = "right",
                                 labels = c("Gráfico 1", "Gráfico 2", "Gráfico 3"),
                                 font.label = list(size = 10, color = "blue"))

graficos_combinados <- annotate_figure(graficos_combinados,
                                       top = text_grob(label = "Estudo sobre consumo de combustível", face = "bold", size = 16),
                                       bottom = text_grob(label = "Fonte:\nDataset mpg", face = "italic", size = 10, color = "red", x = 0.93))

graficos_combinados

# Gerando a imagem
tiff(filename = "estudo.tiff", width = 3500, height = 3500, res = 300)
graficos_combinados
dev.off()

