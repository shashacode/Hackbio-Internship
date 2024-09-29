<!--StartFragment-->

GENE EXPRESSION ANALYSIS OF GLIOBLASTOMA GENE DATASET 

Contributors: - Flora (<floraoladipupo@gmail.com>), Keshav Pande (keshavpande1603\@gmail.com) Abdulqudus Oladega (<oladegakenny@gmail.com>)

Link to code: <https://github.com/shashacode/Hackbio-Internship/blob/main/Stage%202/Glib%20Analysis.R>

Link to Dataset: <https://github.com/shashacode/Hackbio-Internship/blob/main/Stage%202/glioblastoma.csv>

Overview

Glioblastoma is a complex malignancy of the brain with intricate genetic makeup. Gene expression patterns though can provide an understanding of its biological mechanisms. 

Understanding the molecular mechanisms driving this disease requires in-depth analysis of gene expression data. In this report, we analyzed gene expression data to:

1. Visualize the relationships among genes and samples using **heatmap clustering**.

2. Identify **upregulated and downregulated genes**.

3. Perform **functional enrichment analysis** using ShinyGO to determine the biological pathways significantly associated with these genes.

4. **Interpret the top 3 enriched pathways** that are relevant to glioblastoma pathogenesis.

**Heatmap Clustering Analysis**

The heatmap analysis, with variations in clustering approaches, offers different insights into the structure of the data and underlying biological relationships. 

**Sequential Color Palette Heatmap**
#### ![Figure 1: Sequential Color Palette Heatmap.](https://github.com/shashacode/Hackbio-Internship/blob/main/Stage%202/Images/sequential.jpg)

**Diverging Color Palette Heatmap**
#### ![Figure 2: Diverging Color Palette Heatmap.](https://github.com/shashacode/Hackbio-Internship/blob/main/Stage%202/Images/diverging.jpg)

**Heatmap of Clustering genes (rows)**
#### ![Figure 3: Diverging Color Palette Heatmap.](https://github.com/shashacode/Hackbio-Internship/blob/main/Stage%202/Images/cluster(row).jpg)

**Heatmap of Clustering genes (columns)**
#### ![Figure 4: Diverging Color Palette Heatmap.](https://github.com/shashacode/Hackbio-Internship/blob/main/Stage%202/Images/cluster (columns).jpg)

**Heatmap Clustering of both genes and samples**
#### ![Figure 5: Diverging Color Palette Heatmap.](https://github.com/shashacode/Hackbio-Internship/blob/main/Stage%202/Images/cluster (both).jpg)

<!--StartFragment-->

A heatmap is an intuitive and effective way to visualize complex datasets, such as gene expression data. The choice of color palette greatly influences how easily patterns, clusters, and relationships within the data are perceived by the viewer. 

**The importance of color selection in plots visuals**

A sequential palette allows for a smooth visual transition from low to high values, making it easier to identify gradients in the data, such as gradual changes in gene expression levels. Shades of blue is a good fit in sequential heatmaps, where lighter shades represent lower expression levels and darker shades represent higher expression levels.

<!--StartFragment-->

A **diverging color palette** is useful when data can vary in two directions from a central point. This is particularly useful for visualizing **fold change** in gene expression, where some genes are upregulated (high expression) and others are downregulated (low expression). A good color choice is the **Red-Blue** palette, where one color represents downregulation (e.g., blue) and the other represents upregulation (e.g., red). The central, neutral color (e.g., white or gray) represents no change or baseline expression levels.


### **Overall Insights from the Heatmap Clustering:**

- **Gene Clustering Alone**: Helps to identify functionally related gene clusters, potentially pointing to biological processes or pathways relevant to glioblastoma progression.

- **Sample Clustering Alone**: Reveals how samples group together based on gene expression, potentially identifying distinct glioblastoma subtypes or treatment effects.

- **Both Genes and Samples Together**: Offers a comprehensive view of how gene expression patterns differ across sample groups, allowing you to simultaneously see co-regulated genes and the sample groups they are most active in.

**Subset of Upregulated and Downregulated Genes**

#### ![Figure 6: Gene Expression Chart for Down regulated and Upregulated gene.](https://github.com/shashacode/Hackbio-Internship/blob/main/Stage%202/Images/fold change.jpg)

**Top 5 Enriched Pathways**
#### ![Figure 7: Top 5 Enriched .](https://github.com/shashacode/Hackbio-Internship/blob/main/Stage%202/Images/enrichment path.jpg)

The top 3 Enriched Pathways include Cytokine-Cytokine Receptor Interaction (hsa04060), Viral Protein Interaction with Cytokine and Cytokine Receptor (hsa04061), Chemokine Signaling Pathway (hsa04062)

<!--StartFragment-->

The **Cytokine-Cytokine Receptor Interaction** pathway plays a crucial role in regulating immune responses and cell signaling. In glioblastoma, cytokines such as IL-6, IL-8, TNF-α, and TGF-β are often overexpressed, leading to the creation of an immunosuppressive microenvironment. This enables the tumor to evade immune surveillance, supporting tumor growth, angiogenesis, and resistance to therapies. The dysregulation of cytokines in the tumor microenvironment promotes glioblastoma growth and resistance to immune therapies, making this pathway a key target for therapeutic intervention (Wainwright et al., 2014). This pathway had 21 genes enriched in it, with a high-fold enrichment (5.94). This suggests that the dataset is heavily associated with immune responses, particularly involving cell signalling through cytokine interactions. 

The **Viral Protein Interaction with Cytokine and Cytokine Receptor** pathway illustrates how viruses can manipulate the host immune system by interacting with cytokines and their receptors. Viruses often produce proteins that interfere with cytokine signaling, enabling them to evade immune detection and promote viral replication (Garcia-Sastre & Biron, 2006). This pathway is is particularly relevant to glioblastoma in the context of oncolytic virotherapy, a promising treatment strategy (Martikainen & Essand, 2019). Exploiting viral protein interactions with cytokine pathways offers a novel therapeutic avenue through oncolytic virotherapy, which boosts immune responses and attacks tumor cells.

<!--StartFragment-->

The **Chemokine Signaling Pathway** regulate the recruitment of immune cells to the tumor microenvironment. Chemokines are a subset of cytokines that specifically control the migration (chemotaxis) of immune cells such as leukocytes (Zlotnik & Yoshie, 2012). In glioblastoma, however, this pathway is frequently co-opted to recruit immunosuppressive cells such as tumor-associated macrophages (TAMs) and regulatory T cells (Tregs). These cells support tumor growth by suppressing the anti-tumor immune response and promoting angiogenesis and tumor invasiveness (Zha et al., 2020)

**Conclusion**

In conclusion, the integration of gene expression analysis, functional enrichment, and visualization provides a comprehensive understanding of the molecular mechanisms underlying glioblastoma. This analysis has not only confirmed the relevance of well-known pathways involved in glioblastoma but has also provided a foundation for further research into potential therapeutic strategies.

<!--StartFragment-->

**References**

Martikainen, M., & Essand, M. (2019). "Oncolytic viruses for the treatment of solid tumors: clinical evidence and barriers." _Journal of Clinical Investigation_, 129(2), 558-569. <https://doi.org/10.1172/JCI121491>

Wainwright, D. A., Balyasnikova, I. V., Chang, A. L., Ahmed, A. U., & Lesniak, M. S. (2014). "TGF-β signaling in glioblastoma and the tumor microenvironment." _Cell & Bioscience_, 4, 29. <https://doi.org/10.1186/2045-3701-4-29> 

Zha, C., Meng, X., Li, L., & Mi, S. (2020). "Chemokines: Promising Immune-Based Targets in Glioblastoma." _Frontiers in Immunology_, 11, 592097. <https://doi.org/10.3389/fimmu.2020.592097>

Zlotnik, A., & Yoshie, O. (2012). "The Chemokine Superfamily Revisited." _Immunity_, 36(5), 705-716. <https://doi.org/10.1016/j.immuni.2012.05.008> 

<!--StartFragment-->\ <!--EndFragment--><!--EndFragment--><!--EndFragment-->

<!--EndFragment-->



