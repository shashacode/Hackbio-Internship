<!--StartFragment-->

 **Title: Large-scale RNA-Seq Transcriptome Analysis of 4043 Cancers and 548 Normal Tissue Controls across 12 TCGA Cancer Types**

  **_Author :_**_- A Study by Li Peng, Xiu Wu Bian, Di Kang Li, Chuan Xu,Guang Ming Wang, Qing You Xia, Qing Xiong._

                                **Summarized by @Keshav Pande, @Flora Oladipupo**

                          **(**[**keshavpande1603@gmail.com**](mailto:keshavpande1603@gmail.com)**, floraoladipupo\@gmail.com)**



<!--EndFragment-->
<!--StartFragment-->

**Introduction** 

- This study focuses on analyzing large-scale RNA-Seq transcriptome data from The Cancer Genome Atlas (TCGA)

- It comprises 4043 cancer samples from 12 different cancer types and 548 normal tissue controls.

- The aim was to identify gene expression alterations across these cancer types, define common (cross-cancer) and specific gene signatures, and explore their implications for cancer diagnosis and treatment.

<!--EndFragment-->

<!--StartFragment-->

- **Methodology**

<!--StartFragment--> 1] Differential gene expression <!--EndFragment-->

<!--EndFragment-->
#### ![Figure 1: Heatmap of Differential Gene Expression](https://github.com/shashacode/Hackbio-Internship/blob/main/figure%201.jpg)
- Lung Cancer (LUAD AND LUSC) were found to share over 55% of their DEGs, indicating high similarity.
- KICH and KIRC, despite being both kidney cancers, display less than 10% shared DE genes, indicating divergent gene expression profiles. This suggests that kidney cancer subtypes have unique molecular characteristics.
- THCA (Thyroid carcinoma) also exhibit low overlap with other cancers in terms of DE genes.

<!--StartFragment-->

<!--StartFragment--> 2] Cro <!--EndFragment-->

<!--EndFragment-->

#### ![Table 1: The normalized expression levels of seven cross-cancer gene signatures across 12 types of cancer and normal samples.](https://github.com/shashacode/Hackbio-Internship/blob/main/figure2.jpg)

- Seven significant cross-cancer gene sets were identified, which were altered in at least four different cancer types.
- CLUSTER241: Altered in seven cancer types (e.g., BLCA, BRCA, COAD, LUAD). This cluster was enriched in pathways like mitotic prometaphase and M phase, key stages in cell division.
- CLUSTER514: Also involved in the cell cycle and associated with cancers like BLCA, BRCA, and LUAD.

<!--StartFragment--> 3] Cross-cancer gene Signature <!--EndFragment-->
#### ![Figure 2: The normalized expression levels of SFTPA1 and SFTPA2 across 12 types of cancer and normal samples. ](https://github.com/shashacode/Hackbio-Internship/blob/main/fig3.jpg)
- Thirty-seven cancer-specific gene sets were identified.
- CLUSTER1520: A lung cancer-specific gene set containing genes like SFTPA1 and SFTPA2, which are associated with lung function and diseases. These genes were notably downregulated in lung cancer samples.

## Results

### 1. Validation - Leave-One-Out Cross-Validation (LOOCV)
#### ![Figure 3: The Predictive Accuracy and Error Rates of LOOCV for Each Cancer Type Using the 14-gene Signature](https://github.com/shashacode/Hackbio-Internship/blob/main/fig4.jpg) 
- **Red** indicates predictive accuracy.  
- **Blue** represents error rates.
  
- For each cancer type, one sample is removed from the dataset, and the model is trained using the remaining data.
- The model is then tested on the removed sample to predict whether it is normal or cancerous.
- This process is repeated for each sample in the dataset until every sample has been tested once.
- Afterward, the predictive accuracy (the percentage of correctly classified samples) is calculated for each cancer type.

### 2. Validation with Non-TCGA Datasets

- **GSE40419**: 87 lung adenocarcinoma samples and 77 normal lung tissue samples. Predictive accuracy: **97.1%**.
- **GSE50760**: Colorectal cancer samples (18 primary cancer samples, 18 liver metastasis samples, and 18 normal colon samples). Predictive accuracy: **96.23%**.

## Discussion

- Cancer-specific gene signatures confirm unique transcriptional alterations as key drivers in individual cancers.
- The identification of both cross-cancer and cancer-specific gene signatures provides a pathway to novel diagnostic markers and therapeutic targets.
- The 14-gene signature’s high predictive accuracy proves its effectiveness in distinguishing cancerous from normal tissues.

## Conclusion

This large-scale RNA-Seq analysis identified key gene expression changes across multiple cancers, revealing both cross-cancer and cancer-specific gene signatures.  
These findings advance the understanding of cancer biology and present new potential biomarkers for diagnosis and treatment.

[Link to Video Presentation](https://www.linkedin.com/feed/update/urn:li:activity:7241177952422404096/)

