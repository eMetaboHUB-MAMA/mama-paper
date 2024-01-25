# MAMA | JOSS publication

## Metadata

* authors: <nils.paulhe@inrae.fr>, <franck.giacomoni@inrae.fr>, ... 
* creation date: `2022-12-09`
* main usage: this repository stores files for the `MAMA publication` submission

This project is used to host MAMA's paper files, and build a temporary `pdf` file.

## MAMA public code repositories

- [MAMA-WebApp](https://github.com/eMetaboHUB-MAMA/mama-webapp) - a light webapp used to query the MAMA-REST API
- [MAMA-REST](https://github.com/eMetaboHUB-MAMA/mama-rest) - a RESTFul API
- [MAMA-REST Doc](https://github.com/eMetaboHUB-MAMA/mama-rest-doc) - the REST API documentation (latex)

Note: repositories are mirrored on a private GitLab instance used for daily developments.

## Getting Started

The template files are provided thanks [JOSS publisher](https://joss.theoj.org/).
Run the following command to build the PDF draft (note: it requires to have the docker engine installed on your computer).

```
docker run --rm \
    --volume $PWD/paper:/data \
    --user $(id -u):$(id -g) \
    --env JOURNAL=joss \
    openjournals/inara
```

<!--
## Authors

* **Firstname lastname** - *Initial work* - 

See also the list of [contributors](https://unh-pfem-gitlab.ara.inrae.fr/your/projectcontributors) who participated in this project.

## License

This project is licensed under the XXX License - see the [LICENSE.md](LICENSE.md) file for details
-->

## Acknowledgments

The `MAMA` project is supported by the French National Facility in Metabolomics & Fluxomics, 
MetaboHUB (11-INBS-0010), 
launched by the French Ministry of Research and Higher Education and the French ANR funding agency within the Programme "Investissements d’Avenir". 
The authors thank all MetaboHUB nodes and French metabolomics facilities for their investment in the development project. 
We also thank Professor D. Rolin for his continual support of the project and its team.
