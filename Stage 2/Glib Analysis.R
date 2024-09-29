# Load necessary libraries
library(gplots)
library(RColorBrewer)
library(pheatmap)
library(dplyr)
library(readr)
library(ggplot2)



# Load the data
glibdata <- read.csv('~/HackBio/stage2/glioblastoma.csv', header = TRUE)

# Set the first column as row names
rownames(glibdata) <- glibdata[,1]
glibdata <- glibdata[,-1]  # Remove the first column after setting row names

# Save the processed data
#write.csv(data_scaled, '~/HackBio/stage2/processed_glioblastoma_scaled.csv', row.names = TRUE)

# Display a message
cat("Data preprocessing completed and saved.\n")

# Apply log2 transformation with offset 1 to numeric columns
numeric_cols <- sapply(glibdata, is.numeric)
data_log <- glibdata  # Copy the original data
data_log[numeric_cols] <- lapply(glibdata[numeric_cols], function(x) log2(x + 1))

# Prepare data for the heatmap (ensure only numeric data is passed)
heatmap_data <- as.matrix(data_log[numeric_cols])


heatmap.2(heatmap_data, 
          col = colorRampPalette(c("blue", "white", "red"))(100),  
          trace = "none", 
          density.info = "none", 
          scale = "row",  
          dendrogram = "both", 
          lwid = c(1.5, 4),  # Adjust width of side columns (left: dendrogram, right: heatmap)
          lhei = c(1, 4),    # Adjust height of top rows (top: dendrogram, bottom: heatmap)
          cexRow = 0.7, 
          cexCol = 0.7, 
          main = "Heatmap with Diverging Palette")

# Generate a heatmap with a sequential color palette (e.g., sequential blues)
heatmap.2(heatmap_data, 
          col = brewer.pal(9, "Blues"),  # Sequential palette
          trace = "none", 
          density.info = "none", 
          scale = "row",  # Assuming data is already scaled
          dendrogram = "both",
          main = "Heatmap with Sequential Palette")

# Cluster genes (rows) only, no clustering on samples (columns)
heatmap.2(heatmap_data, 
          col = rev(brewer.pal(10, "RdBu")),  # Diverging Red-Blue palette
          trace = "none", 
          density.info = "none", 
          scale = "row",  # Row-wise scaling
          Rowv = TRUE,    # Cluster rows (genes)
          Colv = FALSE,   # Do not cluster columns (samples)
          dendrogram = "row",  # Show dendrogram for rows only
          main = "Heatmap: Cluster Genes (Rows) Only")

# Cluster samples (columns) only, no clustering on genes (rows)
heatmap.2(heatmap_data, 
          col = rev(brewer.pal(10, "RdBu")),  # Diverging Red-Blue palette
          trace = "none", 
          density.info = "none", 
          scale = "row",  # Row-wise scaling
          Rowv = FALSE,   # Do not cluster rows (genes)
          Colv = TRUE,    # Cluster columns (samples)
          dendrogram = "col",  # Show dendrogram for columns only
          main = "Heatmap: Cluster Samples (Columns) Only")

# Cluster both genes (rows) and samples (columns)
heatmap.2(heatmap_data, 
          col = rev(brewer.pal(10, "RdBu")),  # Diverging Red-Blue palette
          trace = "none", 
          density.info = "none", 
          scale = "row",  # Row-wise scaling
          Rowv = TRUE,    # Cluster rows (genes)
          Colv = TRUE,    # Cluster columns (samples)
          dendrogram = "both",  # Show dendrogram for both rows and columns
          main = "Heatmap: Cluster Both Genes and Samples")

# Assume 'control' and 'treatment' group columns are in the dataset
# Define control and treatment samples (adjust column names as needed)
control_samples <- c(1,2,3,4,5)   
treatment_samples <- c(6,7,8,9,10)


# Calculate fold change (treatment/control)
glibdata <- glibdata %>%
  mutate(mean_control = rowMeans(select(., all_of(control_samples))),  # Mean of control samples
         mean_treatment = rowMeans(select(., all_of(treatment_samples))),  # Mean of treatment samples
         fold_change = mean_treatment / mean_control)  # Fold change (treatment/control)
glibdata <- glibdata %>%
  mutate(log2_fold_change = log2(fold_change))

# Apply t-test for each gene
glibdata <- glibdata %>%
  rowwise() %>%
  mutate(p_value = t.test(c_across(all_of(control_samples)), 
                          c_across(all_of(treatment_samples)))$p.value) %>%
  ungroup()


# Define significance thresholds
fold_change_cutoff <- 1.5     # Define threshold for upregulation/downregulation
p_value_cutoff <- 0.05        # Define significance level

# Subset significantly upregulated genes
upregulated_genes <- glibdata %>%
  filter(log2_fold_change > log2(fold_change_cutoff) & p_value < p_value_cutoff)

# Subset significantly downregulated genes
downregulated_genes <- glibdata %>%
  filter(log2_fold_change < -log2(fold_change_cutoff) & p_value < p_value_cutoff)

glibdata <- glibdata %>%
  mutate(significant = case_when(
    p_value < 0.05 & fold_change > 1 ~ "Upregulated",
    p_value < 0.05 & fold_change < 1 ~ "Downregulated",
    TRUE ~ "Not Significant"
  ))

# Save results to CSV
write.csv(upregulated_genes, "~/HackBio/stage2/upregulated_genes.csv")
write.csv(downregulated_genes, "~/HackBio/stage2/downregulated_genes.csv", row.names = FALSE)  # Set row.names = FALSE if you don't want row numbers in the CSV

# Create a volcano plot
ggplot(glibdata, aes(x = fold_change, y = -log10(p_value))) +
  geom_point() +
  theme_minimal() +
  labs(title = "Volcano Plot", x = "Fold Change", y = "-log10(p_value)")

# Volcano plot
ggplot(glibdata, aes(x = fold_change, y = -log10(p_value)) ) +
  geom_point(aes(color = p_value < 0.05 & abs(fold_change) > 1), alpha = 0.5) +
  scale_color_manual(values = c("black", "red")) +
  theme_minimal() +
  labs(title = "Volcano Plot", x = "Fold Change (log2)", y = "-log10(P-value)")

# Create the lollipop chart
ggplot(glibdata, aes(x = fold_change, y = -log10(p_value), color = significant)) +
  geom_point(size = 3) +  # Points for each gene
  geom_segment(aes(xend = fold_change, yend = 0), size = 1) +  # Lines connecting points to x-axis
  scale_color_manual(values = c("Upregulated" = "red", "Downregulated" = "blue", "Not Significant" = "grey")) +
  theme_minimal() +
  labs(title = "Lollipop Chart of Gene Expression",
       x = "Fold Change",
       y = "-log10(P-value)",
       color = "Significance") +
  theme(legend.position = "top")