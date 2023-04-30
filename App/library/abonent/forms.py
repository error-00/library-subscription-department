from datetime import date
from django.core.exceptions import ValidationError
from django.utils.translation import gettext_lazy as _
from .models import *
from django import forms


# Check date of birthday
def validate_birth_date(birth_date):
    age = (date.today() - birth_date).days // 365
    if age < 17:
        raise ValidationError(_("Читачі повинні бути не молодше 17 років"), params=
        {
            'birth_date': birth_date
        }, )


# Add reader
class ReaderForm(forms.ModelForm):
    birth_date = forms.DateField(validators=[validate_birth_date], widget=forms.DateInput(attrs={
        'class': 'form-control',
        'type': 'date',
        'format': 'dd/mm/yyyy',
    }))

    class Meta:
        model = Reader
        fields = ['PIB', 'home_adress', 'tel_work', 'tel_home', 'birth_date']
        widgets = {
            'PIB': forms.TextInput(attrs={
                'class': 'form-control',
                'placeholder': 'ПІБ'
            }),
            'home_adress': forms.TextInput(attrs={
                'class': 'form-control',
                'placeholder': 'Адреса'
            }),
            'tel_work': forms.TextInput(attrs={
                'class': 'form-control',
                'placeholder': 'Робочий телефон'
            }),
            'tel_home': forms.TextInput(attrs={
                'class': 'form-control',
                'placeholder': 'Домашній телефон'
            }),
            'birth_date': forms.DateInput(attrs={
                'class': 'form-control',
                'type': 'date',
                'format': 'dd/mm/yyyy'
            }),
        }


# Change information about reader
class ReaderFormChange(forms.ModelForm):
    class Meta:
        model = Reader
        fields = ['PIB', 'home_adress', 'tel_work', 'tel_home', 'birth_date']
        widgets = {
            'PIB': forms.TextInput(attrs={
                'class': 'form-control',
                'placeholder': 'ПІБ'
            }),
            'home_adress': forms.TextInput(attrs={
                'class': 'form-control',
                'placeholder': 'Адреса'
            }),
            'tel_work': forms.TextInput(attrs={
                'class': 'form-control',
                'placeholder': 'Робочий телефон'
            }),
            'tel_home': forms.TextInput(attrs={
                'class': 'form-control',
                'placeholder': 'Домашній телефон'
            }),
            'birth_date': forms.DateInput(attrs={
                'class': 'form-control',
                'type': 'date',
                'format': 'dd/mm/yyyy'
            }),
        }

    def __init__(self, *args, **kwargs):
        super(ReaderFormChange, self).__init__(*args, **kwargs)
        self.fields['PIB'].widget.attrs['value'] = self.instance.PIB
        self.fields['home_adress'].widget.attrs['value'] = self.instance.home_adress
        self.fields['tel_work'].widget.attrs['value'] = self.instance.tel_work
        self.fields['tel_home'].widget.attrs['value'] = self.instance.tel_home
        self.fields['birth_date'].widget.attrs['value'] = self.instance.birth_date
        self.fields['birth_date'].disabled = True
        self.fields['birth_date'].widget.attrs['readonly'] = True


# Issue book
class BookDeliveryForm(forms.ModelForm):
    readers = forms.ModelChoiceField(queryset=Reader.objects.all(),
                                     widget=forms.Select(attrs={'class': 'form-control select2'}))
    book = forms.ModelChoiceField(queryset=Book.objects.all(),
                                  widget=forms.Select(attrs={'class': 'form-control select2'}))
    date_issue = forms.DateField(
        widget=forms.DateInput(
            attrs={'class': 'form-control', 'type': 'date', 'id': 'id_date_issue'}),
        initial=date.today())
    date_must_return = forms.DateField(
        widget=forms.DateInput(attrs={'class': 'form-control', 'type': 'date', 'id': 'id_date_must_return'}),
        initial=date.today() + timedelta(days=14), required=False)

    class Meta:
        model = BooksDelivery
        fields = ['readers', 'book', 'date_issue', 'date_return', 'date_must_return']

    def clean(self):
        cleaned_data = super().clean()
        readers = cleaned_data.get('readers')
        book = cleaned_data.get('book')

        return cleaned_data


class BookReturnForm(forms.ModelForm):
    readers = forms.ModelChoiceField(
        queryset=Reader.objects.all(),
        widget=forms.Select(attrs={'class': 'form-control select2'}))
    book = forms.ModelChoiceField(queryset=Book.objects.all(),
                                  widget=forms.Select(attrs={'class': 'form-control select2'}))
    date_return = forms.DateField(
        widget=forms.DateInput(
            attrs={'class': 'form-control', 'type': 'date', 'id': 'id_date_return', 'readonly': 'true'}),
        initial=date.today(), required=False)

    class Meta:
        model = BooksDelivery
        fields = ['readers', 'book', 'date_issue', 'date_return', 'date_must_return']

    def clean(self):
        cleaned_data = super().clean()
        readers = cleaned_data.get('readers')
        book = cleaned_data.get('book')

        return cleaned_data
