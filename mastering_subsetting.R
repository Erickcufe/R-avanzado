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


# MASTERING SUBSETTING

vect_bio <- c("AMP", "ATP", "cAMP",
              "AMP", "cAMP","ATP", 
              "ATP")
abrev_bio <- c(AMP = "AMP cíclico", ATP = "adenosín trifosfato", 
               cAMP = "adenosín trifosfato")

abrev_bio[vect_bio]
unname(abrev_bio[vect_bio])

df <- mtcars
cyl_int <- c(4,4,4,6,8)
subint <- match(cyl_int, df$cyl)
subint
df[subint, ]

# TOMAR MUESTRAS ALEATORIAS
df[sample(nrow(df)), ]
df[sample(nrow(df), 5), ]
df[sample(nrow(df), 11, replace = FALSE), ] #SI LO PASAMOS A TRUE ...

df2 <- df[sample(nrow(df)), 3:1]
df2[order(df2$disp), ]
df2[, order(names(df2))]

# ELIMINAR COLUMNAS

df[setdiff(colnames(df), "cyl")]
df$cyl <- NULL

df <- mtcars
df[df$carb == 4, ]
df[df$qsec > 16 & df$cyl == 4, ]
df[rownames(df)=="Cadillac Fleetwood", ]

iris_data <- iris
names_iris <- colnames(iris_data)
stringr::str_detect(names_iris, "Petal")
select_col <- stringr::str_detect(names_iris, "Petal")
Species_str <- iris_data[ , select_col]

lenght_virginica_2 <- iris_data[iris_data$Species=="virginica", c(1,3)]

# Con pipe %>% 
lenght_virginica_tidy <- iris_data %>% filter(Petal.Length > 1.6 & Species == "setosa" ) %>% 
  select(Sepal.Length, Petal.Length, Species)


# OCUPANDO LOGICOS
cyl_3 <- df$cyl==4
x2 <- which(cyl_3)

cyl_random <- df[sample(nrow(df), 32),]
cyl_select <- cyl_random$cyl==4
y2 <- which(cyl_select)


# X & Y <-> intersect(x, y)
cyl_3 & cyl_select
intersect(x2, y2)


# X | Y <-> union(x, y)
cyl_3 | cyl_select
union(x2, y2)


# X & !Y <-> setdiff(x, y)
cyl_3 & !cyl_select
setdiff(x2, y2)


# xor(X, Y) <-> setdiff(union(x, y), intersect(x, y))
xor(cyl_3, cyl_select)
setdiff(union(x2, y2), intersect(x2, y2))


