DOXY_EXEC_PATH = /Users/sreenathswaminathan/Desktop/Uni-Docs/Autonomous fahren kurs/CV Project/Assignment/Turbine
DOXYFILE = /Users/sreenathswaminathan/Desktop/Uni-Docs/Autonomous fahren kurs/CV Project/Assignment/Turbine/Doxyfile
DOXYDOCS_PM = /Users/sreenathswaminathan/Desktop/Uni-Docs/Autonomous fahren kurs/CV Project/Assignment/Turbine/doc/perlmod/DoxyDocs.pm
DOXYSTRUCTURE_PM = /Users/sreenathswaminathan/Desktop/Uni-Docs/Autonomous fahren kurs/CV Project/Assignment/Turbine/doc/perlmod/DoxyStructure.pm
DOXYRULES = /Users/sreenathswaminathan/Desktop/Uni-Docs/Autonomous fahren kurs/CV Project/Assignment/Turbine/doc/perlmod/doxyrules.make

.PHONY: clean-perlmod
clean-perlmod::
	rm -f $(DOXYSTRUCTURE_PM) \
	$(DOXYDOCS_PM)

$(DOXYRULES) \
$(DOXYMAKEFILE) \
$(DOXYSTRUCTURE_PM) \
$(DOXYDOCS_PM): \
	$(DOXYFILE)
	cd $(DOXY_EXEC_PATH) ; doxygen "$<"
