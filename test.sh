HOSTNAME=$(hostname -s)
if [[ ${HOSTNAME} = "KCMNAN0001" ]]; then
  ENV=development
elif [[ ${HOSTNAME} = "HCMNAN0001" ]]; then
  ENV=production
elif [[ ${HOSTNAME} = "DCMNAN0001" ]]; then
  ENV=dr
fi
