# Operadores de subsetting (sub conjuntos)
# [[]] [] $

# INTRODUCCIÓN SUBSETTING

# BREVE REPASO EN VECTORES
vector_1 <- c("hola", 1, 2.5, "crayola")
vector_1[2]
vector_1[2.6]
vector_1[c(1,1)]

vector_1[order(vector_1)]


vector_1[-c(2,3)]

vector_1[c(TRUE,FALSE,FALSE,TRUE)]

vector_2 <- setNames(vector_1, c("character1", "number1", "number2","character2"))
# unname(vector_2)

vector_2[c("character1","character2")]
vector_2[c("character1", "character1")]

vector_basura <- c(character1 = "hola", number1 = 1)
vector_basura


# BREVE REPASO EN LISTAS

lista_1 <- list(elemento_1 = c("hola", 1, 2.5, "crayola"),
                elemento_2 = data.frame(c1 = c(1,2,3,4), 
                                        c2 = c(12.4,12.5,7.8,9.9),
                                        c3 = letters[1:4]))
lista_1[1]
lista_1[[1]]
lista_1$elemento_1

lista_1[[1]][c(1,4)]
lista_1$elemento_2[,1]


# BREVE REPASO EN MATRICES
a <- matrix(1:18, nrow = 6)
colnames(a) <- c("C1", "C2", "C3")
a[1,2]

union_matrix <- outer(1:3, letters[1:3], FUN = "paste", sep = ",")
union_matrix[c(1,2), c(1,2)]


# BREVE REPASO EN DATAFRAMES Y TIBBLES
df <- datasets::mtcars
df[df$cyl == 4, ]

df[c(1, 3), ]
df[c("cyl", "gear")]
df[, c("cyl", "gear")]

str(df["cyl"])
str(df[, "cyl"])


a <- matrix(1:4, nrow = 2)
str(a[1, ])
str(a[1, , drop = FALSE])


str(df[, "cyl"])
str(df[, "cyl", drop = FALSE])

vector_factores <- factor(c("a", "b"))
vector_factores[1]
vector_factores[1, drop = TRUE]


