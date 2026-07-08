document.addEventListener('DOMContentLoaded', () => {
  const forms = document.querySelectorAll('form[data-controller="form-validation"]');

  forms.forEach((form) => {
    const passwordField = form.querySelector('input[name*="password"]');
    const confirmationField = form.querySelector('input[name*="password_confirmation"]');

    const setInvalid = (field, message = '') => {
      field.classList.add('is-invalid');
      let feedback = field.parentElement.querySelector('.invalid-feedback');
      if (!feedback) {
        feedback = document.createElement('div');
        feedback.className = 'invalid-feedback';
        field.parentElement.appendChild(feedback);
      }
      feedback.textContent = message;
    };

    const clearInvalid = (field) => {
      field.classList.remove('is-invalid');
      const feedback = field.parentElement.querySelector('.invalid-feedback');
      if (feedback) feedback.remove();
    };

    const validateField = (field) => {
      const value = field.value.trim();
      const type = field.dataset.validate || '';
      const rules = type.split(/\s+/).filter(Boolean);

      const hasValue = value.length > 0;
      const isRequired = rules.includes('required');

      if (isRequired && !hasValue) {
        setInvalid(field, 'Este campo es obligatorio.');
        return false;
      }

      if (rules.includes('email') && hasValue && !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(value)) {
        setInvalid(field, 'Ingrese un correo válido.');
        return false;
      }

      if (rules.includes('rfc') && hasValue && !/^[A-Z0-9]{13}$/i.test(value)) {
        setInvalid(field, 'El RFC debe tener exactamente 13 caracteres alfanuméricos.');
        return false;
      }

      if (rules.includes('curp') && hasValue && !/^[A-Z0-9]{18}$/i.test(value)) {
        setInvalid(field, 'El CURP debe tener exactamente 18 caracteres alfanuméricos.');
        return false;
      }

      if (rules.includes('nss') && hasValue && !/^\d{11}$/.test(value)) {
        setInvalid(field, 'El NSS debe tener exactamente 11 dígitos.');
        return false;
      }

      if (rules.includes('phone') && hasValue && !/^\d{10}$/.test(value)) {
        setInvalid(field, 'El teléfono debe tener exactamente 10 dígitos.');
        return false;
      }

      if (rules.includes('website') && hasValue && !/^(https?:\/\/).+/.test(value)) {
        setInvalid(field, 'Ingrese una URL válida.');
        return false;
      }

      clearInvalid(field);
      return true;
    };

    form.querySelectorAll('input, select, textarea').forEach((field) => {
      field.addEventListener('input', () => validateField(field));
      field.addEventListener('blur', () => validateField(field));
      field.addEventListener('change', () => validateField(field));
    });

    if (passwordField && confirmationField) {
      const validatePasswordMatch = () => {
        if (passwordField.value && confirmationField.value && passwordField.value !== confirmationField.value) {
          setInvalid(confirmationField, 'La confirmación no coincide con la contraseña.');
          return false;
        }
        clearInvalid(confirmationField);
        return true;
      };

      passwordField.addEventListener('input', validatePasswordMatch);
      confirmationField.addEventListener('input', validatePasswordMatch);
    }

    form.addEventListener('submit', (event) => {
      let isValid = true;
      form.querySelectorAll('input, select, textarea').forEach((field) => {
        if (!validateField(field)) isValid = false;
      });

      if (passwordField && confirmationField) {
        if (!validatePasswordMatch()) isValid = false;
      }

      if (!isValid) {
        event.preventDefault();
      }
    });
  });
});
