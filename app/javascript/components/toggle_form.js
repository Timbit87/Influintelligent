const buttonForm = document.getElementById('submit-for-collaboration')
const submissionForm = document.getElementById('submission-form')
const btnClassList = document.getElementById('btn-form-classList')

buttonForm.addEventListener('click', (event) => {
  event.preventDefault();
  submissionForm.classList.toggle('d-none');
  buttonForm.innerText = submissionForm.classList.contains('d-none') ? 'Submit for Collaboration' : 'Close Form';
  btnClassList.classList.toggle('card-button');
  btnClassList.classList.toggle('disable-btn-form');
});