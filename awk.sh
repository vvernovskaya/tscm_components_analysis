BEGIN{
start_new_file=0
timestep=0
read_flag=0
}

{
if ($1=="ITEM:" && $2=="TIMESTEP"){
start_new_file=1
read_flag=0
}
else if (start_new_file==1) {
timestep=$1
start_new_file=0
}

else if ($1=="ITEM:" && $2=="ATOMS"){
read_flag=1
for (i = 3; i < 8; i++) {
printf "%s ",$i > timestep".txt"
}
printf "\n" >> timestep".txt"
}
 
else if (read_flag==1) {
printf "%d ",$1 >> timestep".txt"
printf "%d ",$2 >> timestep".txt"
for (i = 3; i < 6; i++) {
printf "%f ",$i >> timestep".txt"
}
printf "\n" >> timestep".txt"
}
}

END{

}
