# phylogeny workflow for CHASE domain in plant proteomes

This workflow performs a phylogenetic study of the CHASE domain, a protein domain resposible for cytokinin reception in the two-component system in late diverging plants. It is a reimplementation of a paper by [Pils and Heyl 2009](http://www.plantphysiol.org/content/151/2/782.full).

A detailed description can be found on the [Cuneiform website](http://cuneiform-lang.org/example-bioinf/2016/06/30/phylogeny/). This cookbook installs all necessary tools, downloads all necessary data, sets up Cuneiform, and places the [workflow](https://github.com/joergen7/phylogeny/blob/master/templates/default/phylogeny.cfl) in a predetermined location. The cookbook can be run on any system in a virtual machine. For running the cookbook natively, an Ubuntu 16.04 or higher is required.

## Running the Workflow

If you set up the workflow via `kitchen converge`, log into the machine by typing

    kitchen login
    
Execute the workflow script by entering

    cuneiform -d /opt/data /opt/wf/phylogeny.cfl
    
## Authors

- Jörgen Brandt ([@joergen7](https://github.com/joergen7/)) [joergen@cuneiform-lang.org](mailto:joergen@cuneiform-lang.org)

## License

[Apache 2.0](https://www.apache.org/licenses/LICENSE-2.0.html)