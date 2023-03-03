---
#title: 'MAMA: the *M*etaboHUB´s *A*nalyses *MA*nager'
title: 'MAMA: a WebApp to manage Metabolomics Laboratories Analyses Requests'
tags:
  - PHP
  - REST
  - WebApp
  - Lab Requests Manager
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
date: 9 December 2022
bibliography: paper.bib

## Optional fields if submitting to a AAS journal too, see this blog post:
## https://blog.joss.theoj.org/2018/12/a-new-collaboration-with-aas-publishing
#aas-doi: 10.3847/xxxxx <- update this with the DOI from AAS once you know it.
#aas-journal: Astrophysical Journal <- The name of the AAS journal.
---

# Summary

TODO - @npaulhe

<!-- Purpose & Motivation -->
<!-- Problem -->
<!-- Approach -->
<!-- Results -->
<!-- Conclusion -->

# Installation

If you want to install and deploy your own MAMA instance server, 
you can either directly clone `mama-rest` and `mama-webapp` git repositories (option 1) 
or just pull reference Docker images and run these services as Docker containers (option 2).
For both options you will need a MySQL database (refere to the documentation for the tool version and configuration).

<!-- Code repository -->
For option 1 "Code repository", please follow each repository `README.md` file instruction to
install correct third part tools, libraries and dependency (apache and PHP versions, apache and PHP modules and their configuration, ...)
This option is recommanded if you want to fork the project and customize the project to your own needs.

<!-- Docker image -->
Option 2 "Docker image" is only recommended if you want to run MAMA project "as it". 
Warning: you still need to update MAMA configuration files (`config/mama-config.ini` for `MAMA - REST` and `config/mama-webapp.json` for `MAMA WebApp`).
You can either keep these configuration file on the host server and mount them into your Docker containers with `-v | --volumes` docker option or
edit files in their docker containers and `docker commit` changes (and apache daemon restart is required to reload configuration files in both containers).

# Statement of need

<!-- Data management at a lab scale -->
## Introduction - Data management at a lab scale

MetaboHUB is the French National Facility in Metabolomics & Fluxomics created in 2013. 
It aims at providing state-of-the-art tools, services and support in metabolomics and 
fluxomics to academic research teams and industrial partners in the fields of nutrition,
health, agriculture and biotechnology [@rolin:hal-01002241]. 

The MetaboHUB consortium needed a specific tool in order to manage his partners requests. 
The Bioinformatic Workpackage of the project developed this tool: a RESTful API and its WebApp, 
under the "MAMA" label (stands for "**M**etaboHUB´s **A**nalyses **MA**nager"). 

The request was to provide a light WebApp to:
\begin{itemize}
    \item gather the consortium's partners requests (analyses, training, equipment provisioning, \ldots)
    \item split off requests on differents consortium geographical sites.
    \item exchange informations about submited requests; between partners and the consortium, and 
    between consortium nodes.
    \item compute indicators and statics for the consortium funders
\end{itemize}

<!-- Project data management -->
## Project data management

As mentionned, we split the project in three layers

\begin{itemize}
    \item a MySQL database, used to store, organize, and manage software's data.
    \item a REST API, the real "Core" of MAMA software, that process every queries.
    \item a WebApp, light client of this REST API, used to provide a user-friendly GUI.
\end{itemize}

<!-- Portal with internal/external collaborator -->
## Portal with internal/external collaborator

The WebApp is a bridge between our final users (biologists that need mebabolomics analysis) 
and MetaboHUB's experts (that will accept or decline those analysis requests).

End users can describe their metabolomics project (or "analysis request"): 

\begin{itemize}
    \item project generic title and description
    \item project types - "Provision of equipment", "Provision of service - in routine", "Data processing and analysis" or "other"
    \item in case of lab routine analysis, the number and sample to process
    \item relevent keywords - help MetaboHUB's board to adress the project on one (or several) MetaboHUB's consortium platform(s)
    \item scientific context short text description or desription of the scientific context into an attached file (PDF / DOC / ...)
\end{itemize}

All this informations will help MetaboHUB's staff...

\begin{itemize}
    \item to know if the request can be accepted or is out of the MetaboHUB expertise scope.
    \item if the request is rejected, the reason of this rejections (to known potential new area of expertises to develop inside MetaboHUB's consortium).
    \item if the request is accepted, discuss witch MetaboHUB plateform is the more qualified / relevent to perform it.
    \item to get indicators and statics about MetaboHUB's analysis requests (see dedicated section below)
    \item to extract a projects list thanks filters (and download it into a XLS file)
\end{itemize}

MAMA is a support for a dialog between MetaboHUB's users and team members.
At each step of the analysis request processing, users and MAMA staff can enrich the project datasheet.

<!-- FAIR, controled vocabulary and RGPD -->
## FAIR, controlled vocabulary and RGPD

Each entity of the data-model (analysis requests and users) get a unique identifier, used in both WebApp and REST-API URL process queries. 
This strategy ensure us to be **F.A.I.R.** compliant [@wilkinson2016fair].

![MAMA FAIR requirement.\label{fig:figure_faire_principes}](images/figure_faire_principes.png){ width=100% }

Data can not be deleted in MAMA, so FAIR requirement **A2** is not relevent in our case. 
For all other point, MAMA is very **F.A.I.R.** compliant.

MAMA applications use a Metabolomics specific vocabulary. 
It was necessary to be pretty accurate in order to describe **analysis requests** 
however its create a very specialized software. 
If any user wants to use this software outside of a metabolomics analysis field, 
it should update vocabulary used in REST API URLs and GET parameters (require skill in PHP Slim framework) and in the data-model (to create a more consistent code).
For the front-end, all texts displayed in WebApp are defined in javascript and HTML-Template files (it allow us to ensure a French and English localisation);
It's easyer to update GUI vocabulary, just editing those files. 

<!-- Indicators computing -->
## Indicators computing

TODO - @npaulhe

<!-- Many complex and commercial solutions -->
## Many complex and commercial solutions

TODO - @npaulhe

<!-- Dev simple web solution + API  -->
## Dev simple web solution + API

As a part of the MetaboHUB project, the WebService access to the MAMA service is 
integrated in the project’s forth Workpackage. It is possible for anyone to develop
his own client component in order to call the WebService directly. The WebServire 
base URL is: mama-rest.metabohub.fr.

# Methods

We choose to split the project in a light WebApp and a RESTful API. The WebApp bounce on the REST
API for all requests; this is a garanti for the developpers that all core intelligence is centralized in it.
A tiny PHP proxy manage the user sessions to simplify client requests sending to the back-end 
(as mentionned in \autoref{fig:project_structure}).

![MAMA project structure.\label{fig:project_structure}](images/project_structure.png){ width=80% }

## WebApp code part

The WebApp has been developed in early 2016 before the major accession of WebComponents like Angular 
or Vue 2 (both launched on september 2016). Still, we wanted to develop an Application with the same
phylosophie: a light WebApp client that call a RESTful API.

We used [SB Admin 2](http://startbootstrap.com/template-overviews/sb-admin-2/), an open source, 
admin dashboard template for [Bootstrap](http://getbootstrap.com/) created by 
[Start Bootstrap](http://startbootstrap.com/). This template uses Twitter Bootstrap, jQuery and 
HighChart libraries and frameworks. We "forked" the project code at our convinence thanks 
its [Apache 2.0](https://github.com/IronSummitMedia/startbootstrap-sb-admin-2/blob/gh-pages/LICENSE) license.

## REST API code part

The back-end has been developed in PHP 7.4 and requirer third part libraries and frameworks to work. All PHP
modules or system binaries are listed in the project's README file in the `Requirements` section.
The PHP dependency manager [Composer](https://getcomposer.org/) is required in order fetch these frameworks with the correct version:

\begin{itemize}
    \item \textbf{slim} (PHP micro framework to write simple web applications and APIs)
    \item \textbf{doctrine} (database storage and object mapping based on Object Relational Mapper (ORM) and the Database Abstraction Layer (DBAL) concepts) 
    \item \textbf{jobbyphp} (add cron expression to your PHP project \href{https://github.com/jobbyphp/jobby}{view on github})
    \item \textbf{phpmailer} (send emails \href{https://github.com/PHPMailer/PHPMailer}{view on github})
    \item \textbf{phpexcel} (create XLS files \href{https://packagist.org/packages/phpoffice/phpexcel}{view on website})
\end{itemize}

The "MAMA - REST" application require a MySQL database and a SMTP client to work properly. 
These third part tool can be configured in a specific `ini` file. We provide a docker image 
ready to host the application. 

# Features

TODO - @npaulhe

## WebApp

TODO - @npaulhe

### Requests

TODO - @npaulhe

### Projects follow-up

TODO - @npaulhe

### Indicator

TODO - @npaulhe

## REST APIs

TODO - @npaulhe

### Documentation

TODO - @npaulhe

### Open to contributions

TODO - @npaulhe

### Link to @fvinson tool?

TODO - @npaulhe

## Figures

TODO - @npaulhe

### Global dashboard

TODO - @npaulhe

### Indicators deashboard

TODO - @npaulhe

# Acknowledgements

The `MAMA` project is supported by the French National Facility in Metabolomics & Fluxomics, 
MetaboHUB (11-INBS-0010), launched by the French Ministry of Research and Higher Education 
and the French ANR funding agency within the Programme "Investissements d’Avenir". 
The authors thank all MetaboHUB nodes and French metabolomics facilities for their investment 
in the development project. We also thank Professor D. Rolin for his continual support of the 
project and its team.

A special thanks to Dr Justine Bertrand-Michel, Pr Dominique Rolin, Dr Stephanie Durand and
all members involved in this MetaboHUB deliverable for their advices, tests and feedbacks on this project.

<!--
The WebApp's graphical user interfaces for "Create new request" form has been designed to support 
Metabolomics analyses. The vocabulary and the data to submit is specific for this scientific field. 
The web-form statics input can not be easley customisable (static HTML code) however some data like
the consortium geographical sites or project's keywords are managed in the database; that allow MAMA's
administator to easely add or update these tags.

The last need for the consortium is to provide indicators and statistics to the French Research Agency
("ANR - Agence Nationale de la Recherche"), an institute that fund the MetaboHUB consortium. 
The main indicators are about the number of project per consortium node, the repatition of the projects
types, the projects providing sources, the thematic keywords repartitions, \ldots 
It is important for the consortium to track informations about "rejected analyses requests": this might 
help it to focus on new data of expertise to better answer metabolomics' community needs.

An XLS export with all projects and users indicators is also available; it allow to perform custom 
and advanced statistics using Microsoft Excel or LibreOffice softwares. 
Otherwise a developer can code a REST client to perform specific advanced statistics queryies calling
the REST API.

Warning: `MAMA` is just focus on the analyses **requests**. The analyses management in a laboratory 
shall be managed using a "Laboratory Information Management System" software (LIMS). 
Still, MetaboHUB's consortium in-house LIMS softwares can exchange informations with `MAMA REST API`.
-->
<!-- 

-->
<!-- TODO: link to published docker image? -->
<!--
Even if we only use the `JSON` REST output, we also developed `XML` and basic `TEXT` ones. 
Our goal was to open the REST API to any developers, all methods are listed in the 
official documentation 
-->
<!-- TODO link to official REST doc -->

<!-- # Tool capacities  -->
<!-- results/discussion -->

<!--The first objective of the application is to create a bridge between MetaboHUB 
consortium nodes and its partners. Then these partners can follow their analyses 
requests through the same application. 

The second objective was to provide statistics about MetaboHUB's partners and their
analyses requests. -->

<!-- ![Statistics example.\label{fig:statistics_example}](images/statistics_example.png){ width=80% } -->

<!--
plug third part tools on the rest api
rShiny clients? -->

<!--
# Statement of need

`Gala` is an Astropy-affiliated Python package for galactic dynamics. Python
enables wrapping low-level languages (e.g., C) for speed without losing
flexibility or ease-of-use in the user-interface. The API for `Gala` was
designed to provide a class-based and user-friendly interface to fast (C or
Cython-optimized) implementations of common operations such as gravitational
potential and force evaluation, orbit integration, dynamical transformations,
and chaos indicators for nonlinear dynamics. `Gala` also relies heavily on and
interfaces well with the implementations of physical units and astronomical
coordinate systems in the `Astropy` package [@astropy] (`astropy.units` and
`astropy.coordinates`).

`Gala` was designed to be used by both astronomical researchers and by
students in courses on gravitational dynamics or astronomy. It has already been
used in a number of scientific publications [@Pearson:2017] and has also been
used in graduate courses on Galactic dynamics to, e.g., provide interactive
visualizations of textbook material [@Binney:2008]. The combination of speed,
design, and support for Astropy functionality in `Gala` will enable exciting
scientific explorations of forthcoming data releases from the *Gaia* mission
[@gaia] by students and experts alike.-->

<!--
# Mathematics

Single dollars ($) are required for inline mathematics e.g. $f(x) = e^{\pi/x}$

Double dollars make self-standing equations:

$$\Theta(x) = \left\{\begin{array}{l}
0\textrm{ if } x < 0\cr
1\textrm{ else}
\end{array}\right.$$

You can also use plain \LaTeX for equations
\begin{equation}\label{eq:fourier}
\hat f(\omega) = \int_{-\infty}^{\infty} f(x) e^{i\omega x} dx
\end{equation}
and refer to \autoref{eq:fourier} from text.-->

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
