---
title: 'MAMA: a Web application to MAnage Metabolomics laboratory Analysis requests'
tags:
  - PHP
  - REST
  - WebApp
  - Laboratory data manager
authors:
  - name: Nils Paulhe
    orcid: 0000-0003-4550-1258
    equal-contrib: true
    affiliation: "1" # (Multiple affiliations must be quoted)
  - name: Franck Giacomoni
    orcid: 0000-0001-6063-4214
    equal-contrib: true
    affiliation: "1" # (Multiple affiliations must be quoted)
#  - name: Author Without ORCID
#    equal-contrib: true # (This is how you can denote equal contributions between multiple authors)
#    affiliation: 2
#  - name: Author with no affiliation
#    corresponding: true # (This is how to denote the corresponding author)
#    affiliation: 3
affiliations:
 - name: Université Clermont Auvergne, INRAE, UNH, Plateforme d’Exploration du Métabolisme, MetaboHUB Clermont, Clermont‑Ferrand, France
   index: 1
# - name: Institution Name, Country
#   index: 2
# - name: Independent Researcher, Country
#   index: 3
date: 21 August 2023
bibliography: paper.bib

## Optional fields if submitting to a AAS journal too, see this blog post:
## https://blog.joss.theoj.org/2018/12/a-new-collaboration-with-aas-publishing
#aas-doi: 10.3847/xxxxx <- update this with the DOI from AAS once you know it.
#aas-journal: Astrophysical Journal <- The name of the AAS journal.
---

# Summary

<!-- Purpose & Motivation -->
The French National consortium "MetaboHUB" needed a tool to centralize, 
follow-up and compute indicators on submited analysis requests. \
<!-- Problem -->
No existing tool were sutable for this task so the consortium (bio)informatic team
initiate an in-house developements to fulfill these features. \
<!-- Approach -->
We choose to develop a RESTful API <!--(using PHP-Slim) --> to centralize the core methods 
and a light WebApp  <!--(using Twitter-Bootrap and HighChart frameworks)--> to query it. \
<!-- Results -->
The MAMA (the **M**etaboHUB's **A**nalyses **MA**nager) tool is available since late 2016; 
in early 2023, it has been used to record more than 1500 analysis requests. \
<!-- Conclusion -->
Thanks its MIT License, everyone can fork and re-use these developements for its own need.

# Statement of need

<!-- Data management at a lab scale -->
## Introduction

The MAMA team operates within the context of a national network and infrastructure known as "MetaboHUB". 
MetaboHUB is the French National Facility in Metabolomics & Fluxomics created in 2013. 
It aims at providing state-of-the-art tools, services and support in metabolomics and fluxomics to academic research teams 
and industrial partners in the fields of nutrition, health, agriculture and biotechnology [@rolin:hal-01002241].

The idea of MAMA was born when the MetaboHUB consortium had to manage the flow of partner requests from a single portal. 
Building a specific tool based on a RESTful API and its Web application gave birth to the "MAMA" project for "**M**etaboHUB's **A**nalyses **MA**nager". 
Now, The MAMA project becomes **M**etabolomics **A**nalysis **MA**nager an application for managing projects 
and requests for laboratory analyses developed in the framework of a national research infrastructure.

<!-- Project data management -->
## Project data management

The MetaboHUB consortium worked on a fonctionnal specifications of a lightweight web application for managing data and metadata related to metabolomics projects, in particular:

- to centralise requests for analyses from future collaborators or partners of a laboratory or consortium (analyses, bioinformatics processing, training, provision of equipment); 
- to arbitrate and distribute accepted requests between the different departments of a laboratory or geographical sites of a consortium; 
- to exchange information on submitted requests (between partners and the laboratory, or between members of a consortium); 
- to compute indicators to draw up reports for funding bodies.

**Warning**: "MAMA" is focused on the analyses requests part. 
The samples management in the laboratory shall be managed using a "Laboratory Information Management System" software (LIMS). 
In the MetaboHUB context, MAMA exchange informations with commercial LIMS softwares *via* its "MAMA REST API".

<!-- Portal with internal/external collaborator -->
## A portal for internal/external collaborators

The MAMA web application is designed as a bridge between the members of a laboratory or consortium and the users of that facility. 
Our use case here is that of biologists needing metabolomic analyses and experts from a multi-site consortium (chemists, bioinformaticians) handling these requests.

# Installation

To install and deploy a local MAMA instance server:
please, clone `mama-rest` and `mama-webapp` git repositories (option 1)
or just pull reference Docker images and run these services as Docker containers (option 2).

For both options you need a MySQL database (See MAMA documentation for recommanded version and configuration).

<!-- Code repository -->
## Clone/Fork code from Git repository

For option one, please follow each repository `README.md` files instructions to
install and configure correctly third part tools, libraries and dependencies (Apache and PHP modules and versions). 
This option is recommanded if you want to fork the project and implement your own MAMA version.

<!-- Docker image -->
## Use provided Docker image

Option two is only recommended if you want to run the lastest version of the MAMA project. 
**Warning**: you need to update MAMA configuration files (`config/mama-config.ini` for "MAMA - REST" and `config/mama-webapp.json` for "MAMA WebApp"). 
We also advise you to host configuration files on the server side and mount them into your Docker containers with `-v | --volumes` docker option 
or edit directly files in docker containers (then `docker commit` changes; disencouraged).
The Apache daemon must be restart to reload configuration updates in both containers).

<!--# FAIR and GDPR -->

<!--## FAIR

MetaboHUB is an active player in the open science movement and promotes the **F.A.I.R.** (Findability, Accessibility, Interoperability and Reusability) 
principles through the data management of its analytical and scientific activities and within its data science department [@wilkinson2016fair]. 

Each entity of the data-model (analysis requests and users) get a unique identifier, used in both WebApp and REST-API URL process queries. 

![MAMA FAIR requirement.\label{fig:figure_faire_principes}](images/figure_faire_principes.png){ width=100% }

Data can not be deleted in MAMA, so FAIR requirement **A2** is not relevent in our case. 
For all other point, MAMA is very **F.A.I.R.** compliant.

## Controlled vocabulary

MAMA applications use a Metabolomics specific vocabulary. 
It was necessary to be pretty accurate in order to describe **analysis requests** however its create a very specialized software. 
If any user wants to use this software outside of a metabolomics analysis field, 
it should update vocabulary used in REST API URLs and GET parameters (require skill in PHP Slim framework) and in the data-model (to create a more consistent code).
For the front-end, all texts displayed in WebApp are defined in javascript and HTML-Template files (it allow us to ensure a French and English localisations);
It's easyer to update GUI vocabulary, just editing those files. -->

# GDPR - General Data Protection Regulation

MAMA was developed under the territory and jurisdiction of the European Union, and is therefore subject to the GDPR\footnote{General Data Protection Regulation} guidelines [@GDPR:2016].
Core developements were prior to the directives publications however we are compliant on all security points.
We don't store password for LDAP user; for users with "email login" accounts, passwords are hashed with a secure recommended algorithm (we also use a random generated salt option).

For data-consistency and "Quality Assurance" reasons, data can not be deleted (users accounts and analysis requests). 
Users who wish to no longer use MAMA services can delete all personal data from their profile at any time.
Only users' emails / LDAP login informations can not be updated or deleted by users.
However users can contact MAMA's administrators, thanks a dedicated email, to request an anonymisation of all their personnal data in their profile (even email and login).

The next major release of MAMA (scheduled late 2023) will support better GDPR compliance: 
users will be able to call an "account suppression" method from their profile that will anonymize their personnal data 
(equivalent to an "account deletion" for them, but software managers keep anonymous data/metadata for statistics and reporting).
In addition, a cron routine will automaticly detecte long-term inactive accounts (without any active projects and no sign-in in the past five years)
and automaticly anonymize all their personnal data. 
Before that, a warning email will be sent to targeted users in order to avoid unwanted account suppression.

# Methods

MAMA's architecture is based on two projects: 
a lightweight web application and a RESTful application programming interface (API). 
The web application relies on the REST API for all data requests. 
A PHP proxy is in charge of user session management. 
All WebApp / front-end queries are processed in MAMA REST-API (as mentionned in \autoref{fig:project_structure}).

![MAMA project structure.\label{fig:project_structure}](images/project_structure.png){ width=80% }

## Web application code information

The web application was developed at the beginning of 2016, 
before the diffusion in our domains of Web Components frameworks like Angular or Vue 2 (both launched in September 2016). 
Nonetheless, we wanted to develop an application taking up these concepts: a 
lightweight WebApp client that calls a RESTful API.

MAMA's WebApp is based on [SB Admin 2](http://startbootstrap.com/template-overviews/sb-admin-2/), 
an open source admin dashboard template for [Bootstrap](http://getbootstrap.com/) created by [Start Bootstrap](http://startbootstrap.com/). 
This template uses the Twitter Bootstrap libraries and frameworks, jQuery and HighChart. 
We have forked the code of this proposed project through its [Apache 2.0](https://github.com/IronSummitMedia/startbootstrap-sb-admin-2/blob/gh-pages/LICENSE) license.

## RESTful API code information

Back-end latest release requires PHP 8.1 and the following main third-part libraries or frameworks to run:

- **slim** - PHP micro framework to write simple web applications and APIs
- **doctrine** - database storage and object mapping based on Object Relational Mapper (ORM) and the Database Abstraction Layer (DBAL) concepts
- **jobbyphp** - add cron expression to your PHP project - [view on github](https://github.com/jobbyphp/jobby)
- **phpmailer** - send emails - [view on github](https://github.com/PHPMailer/PHPMailer)
- **phpexcel** - create XLS files - [view on website](https://packagist.org/packages/phpoffice/phpexcel)

Main modules are listed in the project's README file in the "Requirements" section. 
The REST API uses [Composer](https://getcomposer.org/) to manage all its dependencies;
it ensure that the correct versions of these modules are retrieved and used (and also manage their sub-dependencies).

The RESTful API requires a MySQL database and an SMTP client. 
These third party tools can be configured in a specific `*.ini` file. 
To facilitate the deployment of the project, the MAMA team provides a complete docker image of the application.

Even if we only use the `JSON` REST output in the "MAMA - WebApp", we also developed `XML` and basic `TEXT` ones. 
Our goal was to open the REST API to any developers.
All methods are listed in the official documentation.

# Features

MAMA application is used as an interface between laboratories or metabolomics platforms offering services and their end-users. 
It can be configured to present all types of analyses and all workflows from managers' catalogue. 

This WebApp also allows management of both users and staff accounts, with different levels of roles in relation to analysis requests management. 
Analysis requests belongs to users and advanced rights management allows laboratory or consortium's staff assigned to each analysis request to view and enrich its informations. 

## Analysis request submission

One of the web-application's main feature is to allow users to submit and view their analyses requests. 
"Create a new request" graphical interface form has been designed to specifically support metabolomics analyses; 
specific work has been carried out to select displayed vocabulary and data types.

It should be noted that web-forms will not be easily customisable (static HTML code); 
but some data such as consortium's "geographical sites" or "keywords", (used to define analysis requests),
are managed in the database allowing a MAMA administrator to easily add or update these tags.

Through the web-application, external collaborators can then describe their metabolomics project (as "analysis request") with the following information:

- **generic title** and **description** of the analysis requests;
- analysis requests **types** - "Equipment provision", "Service provision - routine", "Data processing and analysis" or "other";
- in case of "routine laboratory analysis", the **number of sample to be processed**;
- pick relevant **keywords** in a list - this list is setted by administrators in the WebApp's backoffice;
- **scientific background** - short text description (otherwise, this "scientific context" data can be uloaded in a PDF or DOCX attached file);

All these information will help laboratory or consortium managers:

- to know if the analysis request can be accepted or if it is outside the laboratory or consortium fields of expertises;
- if the analysis request is rejected, the reason(s) for this rejection (to know the potential new areas of expertises to be developed within the laboratory or consortium);
- if the analysis request is accepted, discuss which platform is most qualified/relevant to carry it out;
- calculate indicators on analysis requests (see dedicated section below);
- extract a list of analysis requests through filters (and download it in a Microsoft Office Excel formatted file).

## Analysis requests management dashboard

As soon as a user is logged-in, it will be redirected to a "dashboard" default view thats show all its analysis requests main indicators. 
This view will differ depending on users' permissions offering either a "partner dashboard" or a "laboratory staff dashboard".
User can only see their analysis requests (their status and staff members involved);
managers are allowed to see all submitted analysis requests. 

For the laboratory staff (managers), it also includes secondary functionalities such as an internal messaging system and a "scheduler meeting assistant". 
This dashboard contains indicators on analysis requests and shortcuts to access them. 
For users with the highest security permissions (administrators), indicators about users are also displayed.

![User dashboard.\label{fig:dashboad_user}](images/dashboad_user.png){ width=80% }

![Admin dashboard.\label{fig:dashboad_admin}](images/dashboad_admin.png){ width=80% }

## Indicators

The "statistics" view, only available for administrators, is used to extract and compute differents indicators. 
Indicators' choice is based on the staff team's experience in providing all metadata needed for annual projects or platforms reviews. 
Among these main indicators, MAMA calculates the number of analysis requests by geographical location, 
the distribution of different analysis requests types, their funding sources, or the "thematic keywords" distribution. 
An export in a Microsoft Office Excel format file with all analysis requests' and users' indicators is also available;
it can be used for customised and advanced statistics computing. 

For users with developpers skills, these indicators are also accessible directly trought MAMA REST API; 
This `/projects-statistics` endpoint can compute any indicators with custom "filters" and "group" options. 
Please refer to the "WebServices Guide" in MAMA REST API official documentation. 
**Warning**: in order to access `GET /projects-statistics` path, the provided authentication token must belong to a user-account with "administrator authorizations".

![Indicators example.\label{fig:statistics_example}](images/statistics_example.png){ width=80% }

# Conclusion

MAMA provides a robust and user-friendly solution to manage metabolomics analysis requests. 
Its features, architecture, and design have been carefully crafted to address metabolomics researchers specific needs. 
We believe that the open-source community will greatly benefit from MAMA, and we encourage active participation and contributions to further enhance its capabilities.

## Open to contributions

All MAMA developments are published under an open source license (MIT license). 
The MAMA team is open to contributions from the community. 
Please feel free to fork this code and contact us if you have any questions or problems.

## Acknowledgements

"MAMA project" is supported by the French national metabolomics and fluxomics facility, MetaboHUB (11-INBS-0010), 
launched by the French Ministry of Research and Higher Education and the French funding agency ANR under the "Investissements d'Avenir" programme. 
The authors thank all MetaboHUB nodes and French metabolomics centres for their investment in the development project. 
We also thank Dr Justine Bertrand-Michel, Pr Dominique Rolin, Dr Stephanie Durand for their advice, all the tests and feedback on this project.
Finally we thank Christophe Duperier for the IT support. 

<!--
# Citations

Citations to entries in paper.bib should be in
[rMarkdown](http://rmarkdown.rstudio.com/authoring_bibliographies_and_citations.html)
format.

If you want to cite a software repository URL (e.g. something on GitHub without a preferred
citation) then you can do it with the example BibTeX entry below for @fidgit.

For a quick reference, the following citation commands can be used:
- `@author:2001`  ->  "Author et al. (2001)"
- `[@author:2001]` -> "(Author et al., 2001)"
- `[@author1:2001; @author2:2001]` -> "(Author1 et al., 2001; Author2 et al., 2002)"-->

<!--
# Figures

Figures can be included like this:
![Caption for example figure.\label{fig:figure1}](images/figure.png)
and referenced from text using \autoref{fig:figure1}.

Figure sizes can be customized by adding an optional second parameter:
![Caption for example figure.](images/figure.png){ width=20% }-->

# References
