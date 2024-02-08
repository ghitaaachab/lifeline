const addAllergyButton = document.querySelector('.add-allergy');
const addDiseaseButton = document.querySelector('.add-disease');

addAllergyButton.addEventListener('click', () => {
  const allergyField = document.createElement('div');
  allergyField.innerHTML = `
    <label for="allergy_type">Allergy type:</label>
    <input type="text" name="patient_sheet[allergies_attributes][][name]" class="allergy-input">
    <br>
  `;
  document.querySelector('.mf-allergies').appendChild(allergyField);
});

addDiseaseButton.addEventListener('click', () => {
  const diseaseField = document.createElement('div');
  diseaseField.innerHTML = `
    <label for="disease_name">Disease name:</label>
    <input type="text" name="patient_sheet[diseases_attributes][][name]" class="disease-input">
    <br>
  `;
  document.querySelector('.mf-diseases').appendChild(diseaseField);
});
