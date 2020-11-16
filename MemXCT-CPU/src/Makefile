# ----- Make Macros -----

CXX = mpicxx
CXXFLAGS = -std=c++11 -fopenmp
OPT = -O3 -march=znver2

LD_FLAGS = -fopenmp

TARGETS = memxct
OBJECTS = main.o raytrace.o kernels.o

# ----- Make Rules -----

all:	$(TARGETS)

%.o: %.cpp vars.h 
	@echo "a"
	${CXX} ${CXXFLAGS} ${OPT}  $^ -c -o $@

memxct: $(OBJECTS)
	@echo "b"
	$(CXX) -o $@ $(OBJECTS) $(LD_FLAGS)

clean:
	rm -f $(TARGETS) *.o *.o.* *.txt *.bin core
