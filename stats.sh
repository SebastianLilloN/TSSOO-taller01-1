
#!/bin/bash

forma_uso(){
        printf "\nUso $0 -d <directorio datos> [-h]\n"
        printf "\t-d: directorio donde estan los datos a procesar.\n"
        printf "\t-h: muestra este mensaje y termina.\n"
        exit 1
}

while getopts "d:h" opcion; do
        case "$opcion" in


                d)
                        directorio=$OPTARG
                        ;;

                h)
                        forma_uso
                        ;;
                *)
                        echo "Función invalida"
                        forma_uso
                        ;;
        esac
done




BASEDIR=$(readlink -f $0)
BASEDIR=$(dirname $BASEDIR)

##directorio="$BASEDIR/$directorio"

if [ ! -d $directorio ]; then
        echo "Error: El directorio $directorio no existe."
        exit 1
fi

if [ ! "$(ls $directorio)" ]; then
        echo "El directorio $directorio se encuentra vacio"
  exit 1
fi



Operaciones(){


cmd=$(cat $0 | awk 'BEGIN { min=2**63-1; max=0}{ if($1<min){min=$1};\

        if($1>max){max=$1};\
                total+=$1; count+=1;\
        } \
        END { print":" total":", total/count":", min":", max}')

echo $cmd >>evacuation.txt

}


#problema 1

Arreglo=(`find . -name '*.txt' -print |sort |grep -v '._'`)

#cat ${Arreglo[*]}


Arreglo1=(`find . -name 'executionSummary*.txt' -print |sort |grep -v '._'`)


for i in ${Arreglo1[*]};

 do
         cat $i | tail -n+2 | awk -F ':' 'BEGIN{sum=0}{sum=$6+$7+$8;}END{print sum}'>>suma.txt;       #sumas parciales


         cmd=$(cat suma.txt | awk 'BEGIN{ min=2**63-1; max=0}{ if($1<min){min=$1};\
             if($1>max){max=$1};\
                total+=$1; count+=1;\
             } \
             END { print"TsimTotal\n"":" total":","Promedio\n" total/count":","min\n" min":","max\n" max}')


         cat $i | tail -n+2 | awk -F ':' 'BEGIN{sum=0}{sum=$9;}END{print sum}'>>memoria.txt;          #sumas parciales memoria

         cmd2=$(cat memoria.txt | awk 'BEGIN{ min=2**63-1; max=0}{ if($1<min){min=$1};\

            if($1>max){max=$1};\
                 total+=$1; count+=1;\
            } \
            END { print"Memoria\n" total":","Promedio\n" total/count":","min\n" min":","max\n" max}')

 done

echo $cmd $cmd2 >>metrics2.txt



Operaciones;;

#Sumatotal=$(cat suma.txt | awk 'BEGIN{total=0} {total+=$1} END{print total}')     #(suma total suma.txt)

#prom=$(cat suma.txt  | awk 'BEGIN{total=0; count=0} { total+=$1; count+=1;} END {print total/count}') #(promedio suma.txt)


#Sumatota12=$(cat memoria.txt | awk 'BEGIN{total=0} {total+=$1} END{print total}')       # (suma total memoria.txt)

#Prom2=$(cat memoria.txt  | awk 'BEGIN{total=0; count=0} { total+=$1; count+=1;} END {print total/count}')    # (proemdio memoria.txt)

Operaciones;;



#problema 2

Arreglo2=(`find . -name 'Summary*.txt' -print |sort |grep -v '._'`)

for i in ${Arreglo2[*]}; do cat $i | tail -n+2 | awk -F ':' 'BEGIN{sum=0}{sum+=$7;}END{print sum}'>>suma2.txt; done

#Sumatotal2=$(cat suma2.txt | awk 'BEGIN{total=0} {total+=$1} END{print total}')

#Prom2=$(cat suma2.txt  | awk 'BEGIN{total=0; count=0} { total+=$1; count+=1;} END {print total/count}')


cmd3=$(cat suma2.txt | awk 'BEGIN{ min=2**63-1; max=0}{ if($1<min){min=$1};\

        if($1>max){max=$1};\
                 total+=$1; count+=1;\
        } \
                END { print"alls\n" total":","Promedio\n" total/count":","min\n" min":","max\n" max}')


echo $cmd3 >>evacuation.txt



for i in ${Arreglo2[*]}; do cat $i | tail -n+2 | awk -F ':' '$3 == 0 {sum=0;sum+=$7;print sum};' >> suma2.1.txt; done

#Sumatotal3=$(cat suma2.1.txt | awk 'BEGIN{total=0} {total+=$1} END{print total}')

#Prom3=$(cat suma2.1.txt  | awk 'BEGIN{total=0; count=0} { total+=$1; count+=1;} END {print total/count}')

cmd4=$(cat suma2.1.txt | awk 'BEGIN{ min=2**63-1; max=0}{ if($1<min){min=$1};\

        if($1>max){max=$1};\
                 total+=$1; count+=1;\
        } \
                END { print"residents\n" total":","Promedio\n" total/count":","min\n" min":","max\n" max}')


echo $cmd4 >>evacuation.txt



for i in ${Arreglo2[*]}; do cat $i | tail -n+2 | awk -F ':' '$3 == 1 {sum=0;sum+=$7;print sum};' >> suma2.2.txt; done


#Sumatotal4=$(cat suma2.2.txt | awk 'BEGIN{total=0} {total+=$1} END{print total}')

#Prom4=$(cat suma2.2.txt  | awk 'BEGIN{total=0; count=0} { total+=$1; count+=1;} END {print total/count}')

cmd5=$(cat suma2.2.txt | awk 'BEGIN{ min=2**63-1; max=0}{ if($1<min){min=$1};\

        if($1>max){max=$1};\
                 total+=$1; count+=1;\
        } \
                END { print"visitorsI\n" total":","Promedio\n" total/count":","min\n" min":","max\n" max}')


echo $cmd5 >>evacuation.txt


for i in ${Arreglo2[*]}; do cat $i | tail -n+2 | awk -F ':' '{if ($3==0 && $4==0) {sum=0;sum+=$7;print sum}};'>>.txt; done
