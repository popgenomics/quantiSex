# parameters  
***nDemes*** // number of demes  
***maxIndPerDem*** // carrying capacity per deme  
***nGeneration*** // number of generations to simulate  
***nGenerationUnisex***	// generations at which unisexuals appear in the metapopulation  
***nNtrlLoci*** // number of neutral loci  
***ntrlMutation*** // mutation rate of the ntrl loci  
***nQuantiLoci*** // number of quantitative loci  
***quantiMutation*** // mutation rate of the quantative loci  
***fecundity*** // max number of offspring when femAlloc=100%  
***migration*** // immigration rate  
***extinction*** // extinction rate  
***recolonization*** // number of recolonizing individuals  
***colonizationModel*** // 0 = migrant pool model 1 = propagule pool model  
***sexualSystem*** // 0 = only hermaphrodites; 1 = XY system; 2 = ZW system  
***sexAvantage*** // avantage confered by the Y or Z chromosome over hermaphrodites  
***selfingRate*** // probability to have an ovule being fertilized by sperm from the same individual  
  
# life cycle  
  - loop over generations:  
    * compute for each of the ***nDemes*** deme, ***N***, the number of seeds to produce per individual, equal to __floor(X) + Binom(n=1, p=X-floor(x))__ where __X = ***femaleAllocation*** x ***fecundity***__. The female allocation of an individual is equal to the sum of allelic effects over the ***nQuantiLoci*** loci  
    * sample the ***N*** mothers:  random sampling with replacement among individuals weigted by their femaleAllocation  
    * sample the ***N*** fathers: random sampling with replacement among individuals weighted by their maleAllocation (= 1 - femaleAllocation)  
    * transmission of parental alleles with mutations. Each parental allele of the neutral and quantitative loci has a transmission probability of 0.5  
    * ***compute statistics (mean female-allocation, Fst, Jost's D, etc ...)***
    * sample a number ***nExtinctedDemes*** of extincted demes.  
    * Only the ***nDemes - nExtinctedDemes*** will receive migrants and will send migrants + recolonizers.  
    * __add the migrants/recolonizers__:  
      * loop over demes:  
        * if non-extincted deme (proba = 1-***extinction***):  
          * new number of individuals = number of seeds + number of immigrants the deme will receive  
          * if the new number of individuals > ***maxIndPerDem***:  
            * number of individuals is truncated to ***maxIndPerDem*** with immigrants replacing autochtones  
          * the immigrants only come from the non-extincted demes. For each migrant individual, the emigrant deme is randomly sampled among the non-extincted demes with a probability weighted by their seed production.  
          * for gain of speed, the migrant individual is not produced by a new round of panmixia within the sampled deme, but is a copy/paste of a random individual from the sampled deme (uniform sampling of migrant individuals).  
        * if extincted deme (proba = ***extinction***):
          * new number of individuals = number of recolonizers  
          * the recolonizers only come from the non-extincted demes. For each colonizer individual, the emigrant deme is randomly sampled among the non-extincted demes with a probability weighted by their seed production.  
          * for gain of speed, the colonizer is a copy/paste of a random individual coming from the sampled deme (uniform sampling of colonizers).  

